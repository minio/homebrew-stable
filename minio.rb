class Minio < Formula
  # minio specific
  git_tag = "RELEASE.2019-12-19T22-52-26Z"

  desc "MinIO is an Amazon S3 compatible object storage server"
  homepage "https://github.com/minio/minio"
  url "https://github.com/minio/minio.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/server/minio/release/darwin-amd64/minio.#{git_tag}"
    sha256 "e4efc989166143603943fa436c94a931110f311aa34b543b51c35a020dc25b45"
  elsif OS.linux?
    url "https://dl.minio.io/server/minio/release/linux-amd64/minio.#{git_tag}"
    sha256 "733915b24d547cb92f31a3d4cc80041288f5b6218b9b338f07da85c5cf116631"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

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
    assert_match("getsockopt: connection refused", minio_io.read)
  end
end
