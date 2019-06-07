class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2019-06-07T00-01-32Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{git_tag}"
    sha256 "165423ab286060f6bf597d5cd30f6a397c05b6d6bdaa94b3b1c40c3ac6ca5b8d"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{git_tag}"
    sha256 "bf4658e55c4bd7c506c58cd6ae4eec560ad2cda98aa515fe305fef99f58981ee"
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
