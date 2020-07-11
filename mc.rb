class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-07-11T05-18-52Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "8a1a920741a4df390548ebf7d6f92d1a9370c75df41e44cb3445c0eafd6ec641"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "1bb4ca60fef2559702e0187a9fea92b071bb6a822597bae34102d8786f0ef79f"
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
