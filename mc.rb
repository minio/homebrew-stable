class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-31T08-59-40Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "def76ebcaf86fcbccfc62f03b9a0ee089ec5bd5ae69869e7bbe0b7674758110a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "7f761ba51d1f47a55965dbf3cf8ad581b4f791a45d3e26f6ba01f433bdf9a2c7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "953e7ad44a8d2fa7cc56dcfbd3a0f337e6871ab7bbf218f6076ed38456c80151"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b08fed332bcce1f2a03de4f5a89cb07aef01d7dde9f5593458fe99bb59e5d7dd"
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
