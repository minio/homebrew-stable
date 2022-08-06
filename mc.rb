class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-08-05T08-01-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ff13e742357de905fac2e43919c76770de914a1f8d294f3118ce11979368ba7a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "538e3b677378ba72afbd7db0774d28d0140a1670da9394c2e0b9aec77d83fb93"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "23f7a2c7ba71941c55339253e3c3ed76d09b5e1121e5278fea816d339fd168fe"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "dd5d54e0ad29e10652ff607640bac1dc7289930b6500ff7798ce6123e94a0e94"
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
