class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-10-24T21-42-22Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a3d67902b143f093132bfa2f2a30cbba648372f2c8714fcc17ef07f6be576f4b"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c1d86ebaa17596941f1a65830da758a41497db175a2764a18ec79ddfdcb499ee"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "c1e43804b63bac53585b29ac64d2f0b21e0d6af76075e6ac3f2a39607e59c5c7"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "1609c149cf24eb6238e014e548ab0f66812bbc59d1ae51af8cfe7f006a809a8f"
    end
  end

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
