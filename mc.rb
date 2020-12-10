class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-12-10T01-26-17Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "7ed08498e42647434629c393ab247515cffde044b66221c5d26712abd0959e68"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "a52b5339554afc0b88da553544d4fc69269b8f3888861d053b8f90b19ebee87f"
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
