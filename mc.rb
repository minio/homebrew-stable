class Mc < Formula
  desc "ls, cp, mkdir, diff and rsync for filesystems and object storage"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version "20171014T005116Z"
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc"
    sha256 "968470b0b35c78cce1e1e7837190bbca3c8bf90199aea7d73aedaefe7ed1a1fe"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc"
    sha256 "eb3edd18b5e8cf9b91d02aaf269b850a53800e2828d821a2cfdfc6ee1c14c379"
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
