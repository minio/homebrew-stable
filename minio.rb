class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2022-12-07T00-56-37Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "8b89b3d0b67a5ddb2728de262a7e31be16082400b362f77ef171d1163356256c"
    else
      url "https://dl.min.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "4459881b728e3f8d960b673158526f8d97e1bf6ca1f7b452d9cc45fe6536a460"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "12e11af3c9ec1812f96552f58be6135b8b0fc21217869f250cff43ba1c2378c0"
    else
      url "https://dl.min.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "203eee6f1771e8ee3c36da3a075d78728b3577cc57864b3496e0beec81f164bb"
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
