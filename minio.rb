class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2023-11-11T08-14-41Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "4a30d573f0dfe5f9a999974da10a16ce7edc4465707dd1d801fd094c9f20bb3b"
    else
      url "https://dl.min.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "506fe37d02cb1bfa87e2622b281518f813e04ace4a04f169cb7c04ea82ab07c8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "3c2f0c625ec18601eba5b6c7af4a4f6b526dac19c9e8c96dcc5707cadd694e8b"
    else
      url "https://dl.min.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "1703a84ebf1d61ec88bdb8b4dd712471ad1bc90514a9314b458f9e362c192b5c"
    end
  end

  def install
    bin.install Dir.glob("minio.*").first => "minio"
  end

  def post_install
    ohai "Download complete!"
    ohai "Useful links:"
    puts <<~EOS
      Command-line Access: https://docs.min.io/docs/minio-client-quickstart-guide

      Object API (Amazon S3 compatible):
         Go:         https://docs.min.io/docs/golang-client-quickstart-guide
         Java:       https://docs.min.io/docs/java-client-quickstart-guide
         Python:     https://docs.min.io/docs/python-client-quickstart-guide
         JavaScript: https://docs.min.io/docs/javascript-client-quickstart-guide
         .NET:       https://docs.min.io/docs/dotnet-client-quickstart-guide

      Talk to the community: https://slack.min.io
    EOS
    ohai "Get started:"
    puts `#{bin}/minio server -h`
  end

  test do
    (testpath/"config.json").write <<~EOS
      {
              "version": "14",
              "credential": {
                      "accessKey": "minio",
                      "secretKey": "minio123"
              },
              "region": "us-east-1",
              "browser": "on",
              "logger": {
                      "console": {
                              "level": "error",
                              "enable": true
                      },
                      "file": {
                              "level": "error",
                              "enable": false,
                              "filename": ""
                      }
              },
              "notify": {
                      "redis": {
                              "1": {
                                      "enable": true,
                                      "address": "127.0.0.1:6379",
                                      "password": "",
                                      "key": "minio_events"
                              }
                      }
              }
      }
    EOS
    minio_io = IO.popen("#{bin}/minio --config-dir #{testpath} server #{testpath}/export", :err=>[:child, :out])
    sleep 1
    Process.kill("INT", minio_io.pid)
    assert_match("connection refused", minio_io.read)
  end
end
