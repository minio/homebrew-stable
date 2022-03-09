class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2022-03-08T22-28-51Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "c366d040bfac7c2eadacabb8cfa9aced90f2d7a31560bda33b3620299c01f784"
    else
      url "https://dl.minio.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "55436376ee81fed47db09e9526ac8fe9eabe4e93e1b7075b72b2c7489551ef00"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "5c60b64dea91b1fa89476aa5a8e4c862333ef76f209129578543ad2e7a602165"
    else
      url "https://dl.minio.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "0e0637ed036526710f49a3d6faaea70720fda53f4a2ffd30fca9f0d0ef0a5db9"
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
