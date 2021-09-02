class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-09-02T09-21-27Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
    sha256 "7cde9b771e4e50db6becce8d1c353cd256319a527f61eb08d616834e84be3034"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "43f5a8ea5b0387c56f6c81f42bf6cc05942a5956eba9c088d0fe351b3e990b07"
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
