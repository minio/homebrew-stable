class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-02-20T23-49-54Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "9a851738e61bb2114f46294522c28a7e9dd7179f62758faf9dce5a7973aec8ee"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "3b3b8f304d67af1efba7f6b47103fbba0f04da5948c0d20262ea11ae75a45420"
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
