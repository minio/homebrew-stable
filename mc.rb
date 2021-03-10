class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-03-10T05-59-20Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "5da2bd9658c6ab0f73035d255fc7d4ede0ff6fb57d578e7c9e6c77490babc265"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "799d6e0ba391889f0da35af0730bc61f699401ddd934595f5c52707ca6172dc8"
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
