class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-02-14T04-28-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "8f1a2012839b4b7515d00da5c1deb9b7a953bd633b188f0dc03c594ee1fa82a3"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "3e8b2439546d60a7b7ec68500da7d0515119cbd18e73b79af00bf9b0638178e5"
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
