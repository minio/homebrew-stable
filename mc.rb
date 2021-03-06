class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-03-06T22-16-44Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "d3d7ae5e8575e7fa14f9bfb3053dd27df73f8f746f77c48f3b09187fc2f2b99a"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "0a094cd97f3aefdc2335d54cf364a6adea88d41c25640a8c86819b47ab730ed8"
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
