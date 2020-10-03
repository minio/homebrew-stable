class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-10-03T02-54-56Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "f71f9ee767d69b0aac7f69e750da4e9650a72cfd666330f41199e12bbb483cf0"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "609fa820e8fdf78b30e3a1e15eccd5552d7d26a67b2e707975f4569cb580ab50"
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
