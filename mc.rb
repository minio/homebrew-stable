class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-15T17-46-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "07f039bb6f88e5b7cf53f23085a1896875cf51bcf224e3a97804e583fcfb365c"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "1a62f591b6c644b5525ba8427d10736ab72dccef6f0a773aef2cf450c645fa8f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "dcc84167bf585b94b4f281f6bbc20bef5357c5dd9854cbf7c7796b88eee3b5b4"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "1dcbce9714826032247ed753f4b9a77e5982f918d5109c721df9ddfe5712bfa2"
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
