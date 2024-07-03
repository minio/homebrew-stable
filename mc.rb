class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-03T20-17-25Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "37137709c8b3e207189f0bfe551a2e1f4e1f4d0b390c03f6b94cde48f2aef1e0"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "a921e9054301224e47eef3eb1a321ed75c866a646bab04544855898207753332"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "2bcff27f1b1fff1ca5f0e717f76c7332707fbbe6f43cbbfbe2c44fd6d2400342"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "3a825efd7af6f455d63c732b923fa0db108585192db875797b71f1dc506644aa"
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
