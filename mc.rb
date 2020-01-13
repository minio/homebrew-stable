class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-01-13T22-49-03Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "afba89adcaa66bfd4cd3606ef1a6aa063f42b6c905e765ec50cd70fe849901fa"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "6e5af30404c2e1c9294899dc10094cfdf7e8d8f0a55e49707462a67749ae7828"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
