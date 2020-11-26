class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-11-25T23-04-07Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "a2a2be58fe46d2c93ed31f4e79195ff36a5b1507482119a42d60e3794649a15e"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "985c43f9bec8fdc4ef2ee44c63c9657e10c4cfeb5cb949179d6d693f7428c314"
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
