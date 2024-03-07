class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-07T00-31-49Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "256006e27311a9dd64928d6205187323ce86750e527e65f25526eb68329db38f"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "7ccfabe96eb29ca5841650d9c64df8ed2abed1e42a45595f154c497858a7eb32"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "058aadec53bdb8ef274bb3544af11a1588fa999a904349ea7ea192ff70ce7ca4"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5a9199be9abae92ea1b56949ec0566b6be7e1fd8560a54d099de8003c264126b"
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
