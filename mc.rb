class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-06-08T01-29-37Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
    sha256 "6fd86067eeca2ccff0c06c10519af230ec305710a35f5771b48a4994ba4391a1"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "1870e6b0565fffe2579278755925ece884766fadea8e876b5f041a9eb33d6d4c"
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
