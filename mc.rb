class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-05-06T18-00-07Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "76fcb9a0b9de1b865e1c00fc9a1d3663311d57915a7c5af998677f3b8df8275f"
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
