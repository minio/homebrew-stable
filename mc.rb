class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-07-31T23-34-13Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "3588eb91a1a20f34258838eaf528b1d93869da5cdf94c9df87cbe81b569ca104"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "b430c1cfcbf9aa0b0edddf0777b4c3e6d48b9827ea82973fc7d1a728587ad263"
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
