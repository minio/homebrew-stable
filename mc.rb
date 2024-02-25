class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-02-24T01-33-20Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "4623aea1d0d4c909a02fcb78715f02674f2963a59880729a5e3a569be8e53210"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "03be6c2f73398fb7b017140e1cde040a3141374fe75966aa124a5a7d33c67d38"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "eb352c4172fd46f5dcfce7a1dde2b62efb14ee0765208e472a7e5099e3eef9a1"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "67cacec6aada4b3cd9f1897ca90977afc6f5efebd6167c506a0e619966dac3e7"
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
