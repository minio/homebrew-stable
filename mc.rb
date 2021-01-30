class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-01-30T00-50-42Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "1c67c80708bc1c2ce8af275fd7abb28d4233022b6469bf9dd20c7b48ff5ae44f"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "9b9cbbbfdf316425ceccdc94f6b0bdde687e8c7db21aa5febcfc9757efe3ce86"
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
