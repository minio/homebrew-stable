class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-11-17T19-35-25Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "54ce6be73d2c64fc83a2553b7a5f5cb8d2c874b9ea5f8c51fe4d755656613b6a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e9d7b7f43a364598294b4bd98b926914fb670e8d27f17607d438c730b9c29f32"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d7909d3675dee6d5843f3307c204148a27eaf0d1349d99f776b86e7a6fd935f5"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "544d2d11c32cb4ed11b27338935a9cc434e15b692ff3d1529a624d341fe2ffc5"
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
