class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2024-10-13T13-34-11Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "f0a04006c935a6c8b3003a22b861f120a136070a5672d03907bdb1b61e326137"
    else
      url "https://dl.min.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "cf7c19be13977a4342a4587e66d218fbda1fbc723a024bbaf24152a4cbd2b322"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "d89a1c767182fb599b975b6177b517b17b3bee2d0948dcef4adfd0b886a09354"
    else
      url "https://dl.min.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "1126bbb3276321e7fed0167682d92a03572862f73802658f616af43d9a951e6a"
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
