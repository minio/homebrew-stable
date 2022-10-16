class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-12T18-12-50Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "5d9df318cd09b03c213a6c22dbad017af44dd24d6ec4ef9a59d1ddcdc48ad6f4"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c2f04850cd9aa3b2528c53771705d02722f76023df7c4df64135dd4e3bb12fbd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9fe32ecd22cc9c4d17b32bd55e61edcf9eae836824bd17a2c32baa40b3d6e1fb"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "171498b545d79dc3572bf8d50593f0d98be00aa361f62200d1212d9b0693972d"
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
