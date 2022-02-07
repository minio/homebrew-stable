class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2022-02-07T08-17-33Z"

  desc "High Performance Object Storage compatible with Amazon S3 API"
  homepage "https://min.io"
  url "https://github.com/minio/minio"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/darwin-arm64/archive/minio.#{version}"
      sha256 "9a35fd5e962e772d3e95588515659022fed8bb45d84b0acc4c50166eaead06da"
    else
      url "https://dl.minio.io/server/minio/release/darwin-amd64/archive/minio.#{version}"
      sha256 "163b9c93bed1988ad88ca19e9b766d929735223748c3026420ce05a9c50223e6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/server/minio/release/linux-arm64/archive/minio.#{version}"
      sha256 "cf1cded4b958a36cc9e4996f1292572470da80361d2ebf65400a9e393ce4c858"
    else
      url "https://dl.minio.io/server/minio/release/linux-amd64/archive/minio.#{version}"
      sha256 "11bb5c50b88796e6d63e266cab25317cb06f45e363e182021570e55b9d8de10c"
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
