class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-01-16T02-45-34Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "864956054b472c2dedfe45e6f9b9c26eb90c6ad28ea36ba6aecbfe7b3ea123c8"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "44d29eddc1794ed884a94cb0f3cc4f17d17fa55090a6bb8a2d7c6765db24acba"
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
