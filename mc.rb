class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2019-07-03T18-14-53Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{git_tag}"
    sha256 "25d6c238e01a12c66b39020f1ac489ea90a0338528a102b162f3f05aed044f8c"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{git_tag}"
    sha256 "382c32ecb1b88c90e070f5b5e6d3c83b3984a7db4b6fe318b5c408d85d8f2339"
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
