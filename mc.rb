class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2019-05-29T21-21-34Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{git_tag}"
    sha256 "30172968ee98171eb5f2745ea508f10c8fab8ad1ea944ca75000b17069dd9699"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{git_tag}"
    sha256 "74fac61c9f68a19ae2dedc78bc4a97fc77f319f46d3ab8ecdc966c6116f5c299"
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
