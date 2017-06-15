class Mc < Formula
  desc "ls, cp, mkdir, diff and rsync for filesystems and object storage"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version "20170615T033843Z"
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc"
    sha256 "a871c0ae797b2d11451da56f2097e2c78ead989903905763a408c0e64e5fcb63"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc"
    sha256 "969e0fdbb911d32f8c47601c912da5ce4a7f4c22ff118a4674b452c5f483c049"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install a `mc` binary"

  def install
    bin.install "mc"
  end

  def post_install
    (etc/"mc").mkpath
  end

  test do
    system bin/"mc", "mb", testpath/"test"
    assert File.exist?(testpath/"test")
  end
end
