class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-02-19T05-34-40Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "d2242ab168f42b085161d94c99e895a3d071f2490d87c36ba0c559c73e49bdbb"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "cc3973c6ec6d4bc9a2a822ddd730c6e69cdc21bfa9bf6c84aad8d4672e0e8f95"
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
