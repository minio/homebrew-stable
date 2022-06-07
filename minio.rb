class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2022-06-07T00-33-41Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "545e6a0b048372fda7f4fe6c195fb715c5653996c19091e80aad14e3b1123301"
    else
      url "https://dl.minio.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "88a67d0fb51142d3cbd055ce0568a273c6ff2f680812e969714f467558852d97"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "68716d9534771900d3b6d8c8af40f10c28f17c4db33abe980c4345e3eb07a518"
    else
      url "https://dl.minio.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "72c46ad6bcded286d77288f0ec8f41c0e52e55f0aa9c21b8137f0e00f0de8808"
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
