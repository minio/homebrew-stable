class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-01-03T20-33-14Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "bf460fa610f4faf07eb3c41dcbd0ca8fda3a0558f9a760c1fec33416f9a15be5"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "1bd3133278763fb84ce7344453033fc3e0f954c6ab18efdea84b53e2dd3d0005"
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
