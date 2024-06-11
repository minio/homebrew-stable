class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-10T16-44-15Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "414c9b1f7ec0d822a2112086fb121ea54e20aee2643c9e5d9801c7f11494db7e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "eed8e44fcf9d0461d3ead1325cb0b982748a6b2879b4d935072a734dbe776048"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9a840b407335be7f4fab831bc7be7e1706a2f12271d70adbd7546fd9556b7f51"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a812c176bab63f7d40fa66d80d7bfb896032bbe0f7f821ad609898b5024240e5"
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
