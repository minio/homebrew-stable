class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2019-07-09T23-57-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{git_tag}"
    sha256 "a33ab4443c9a89fc67f26da1f543ae9e84f2085d8d016e56185d6590cb57d551"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{git_tag}"
    sha256 "58c1eb0059fbc68397af60828441fcd8011fc4b6161d39826bbc512394440458"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install `mc` binary"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
    assert File.exist?(testpath/"test")
  end
end
