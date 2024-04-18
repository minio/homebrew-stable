class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2024-04-18T19-09-19Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "59a1c5a71083eaf0a19fe1a48ec92d4bdc5add0c544bdc8728ebdeafa4e84df5"
    else
      url "https://dl.min.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "aea64f5f69697a2da7b2567ead4baae4ae5c8455a29932d5da8567a786c68a3b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "be2a325373ac8630bb55861a822c35c2add00395179fad80979ee0926416cc1e"
    else
      url "https://dl.min.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "818ed0840e0fa95c4714296d9d86bf3b329745c2e75895a54f5082d3fbb26901"
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
