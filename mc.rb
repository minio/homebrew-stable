class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-02-05T20-07-22Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "768f1e0a7ec20f85cbc79301a908d563062d7f04e12d9ad0aa978d76cfb2b11c"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "e3d8059e72e43f13d0419d798a078e8ab5dd9e53bdaea2273d313f3498752904"
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
