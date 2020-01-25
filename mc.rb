class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-01-25T03-02-19Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "51605197d16a8e662282f351f8b6fbec8e9efc37235609e9bc171c63b2f11797"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "792d5365a5fed9ffc14b78a4fbd4ab42bd5a6ff60a58e486075841b4e83975ab"
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
