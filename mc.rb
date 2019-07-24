class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2019-07-24T02-55-56Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{git_tag}"
    sha256 "b5243fbe39dbbef7e51e443ee82c8c132c4005ec1ac1472a4ed57b345d1d55b8"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{git_tag}"
    sha256 "2191e9ba26b8c1d4d4813fc0be322bdf6ce96df08a98a65545629691c40e228d"
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
