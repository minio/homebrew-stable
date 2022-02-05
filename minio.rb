class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2022-02-05T04-40-59Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "7f2e62361c0a6f3320093f35a3397b2422102a24f6102e1b71dee3d8539d2c99"
    else
      url "https://dl.minio.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "1f778a8583f25fb7156b08f44881f1b58c053e0c7ce2bbf2fe281f946d823ad1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "c2d114c6f9f25cbf5383b1ef4aeece4b66ff6c72639e5eb2542e5708414e9ce2"
    else
      url "https://dl.minio.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "6da9843595b4639be58c43443b6fc90d802bab01f8a77a7e88b03bca3b1a6235"
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
