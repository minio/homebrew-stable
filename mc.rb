class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-01-28T20-29-38Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "eb2e00a28e04c2295a8268dbb6a8c789d8a1861a40573e8c9ea96f1ae3132bab"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "cb6e954048a7ff617c7184e3a18715a93167b968f1b6e1a13129a06bdbdb094b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "319fb47eb7f48e3e6efff1151bb82d44463d5c23f94495146c813f9ed2531a4b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ecd7b92a7a5c6e74db16fcd19950a28fa8ccb1fcc343ff37050787da346f7d4e"
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
