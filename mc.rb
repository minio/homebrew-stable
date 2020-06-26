class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-06-26T19-56-55Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "0d0c210bb7f68e00050b69cf9cbf341a2212019d05848d150c163ba3f18ddb29"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "5de3fc5bd45f119437d877abecc40bd1dc7e584d1bf7fd7f12f6b3ea4febedb9"
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
