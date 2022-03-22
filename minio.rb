class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2022-03-22T02-05-10Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "dd8ffd971e42c4346e7df8e7cc87d3f7472bab4f33ebc62c2520d517edf367e8"
    else
      url "https://dl.minio.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "3c5c95dc1109cc422a3aa9850ef7bacbb5328815385aed3ba4b5dbb606228b82"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "6b34ebef5e4dc5a9b4b426257c9699347a4e33fc3352c54bb4bbf377dd218aaa"
    else
      url "https://dl.minio.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "cf1bb06df7b821fe532d4014d4e560d75cf17cc5ed4cc2c51713264445856097"
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
