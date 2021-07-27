class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-07-27T06-46-19Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
    sha256 "eb697f202f073901f8936f001bffcce709dc431fd0c70793cdbb683b895b63ea"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "0df81285771e12e16a0c4c2f5e0ebc700e66abb8179013cc740d48b0abad49be"
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
