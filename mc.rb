class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-02T02-03-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "0e9f0129af2e57b63003cafadbeede19bca63816668e4e9585cd93553098f4f9"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "347ef250f35f45e9bd886cc16ccd2368878b47a0b2f4cbba50ff2509ea705d38"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3e56748fb707e0a85f90c3da3c9829cde86cf80222f94e5545c556baa4777d60"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "bd30523cd697d2f0855ad43907a31c188e0e3fb90d59d514451982e086d9fdd2"
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
