class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2023-11-06T22-26-08Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "2ec10aeecf6cd88208eec3b0dec48d3ddad5deadcc57bc834d9b39d8e03d1c64"
    else
      url "https://dl.min.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "e78ac25dc826b6167be218c91414e93338cb7fc0cb4457c0b5993f6b6570e7f4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "fbe48c147aa5a347b884fb82abd64f2254fab91805214d7c1b7c0e5b8eaa7500"
    else
      url "https://dl.min.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "582e8371c551f08846f82d555693327bebe7890e3217e466749f813495644d9d"
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
