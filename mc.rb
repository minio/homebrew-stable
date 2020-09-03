class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-09-03T00-08-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "3d560e02ea09bd2a96f6305a34d6ce1eb2ee1848906a62b4b1d2eacd991e99b7"
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
