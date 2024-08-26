class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-08-26T10-49-58Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "92043f8a3ec7d121296ed95f69cb4bac8f92f83b5f4a10dc3239f1a496ce1780"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "91f94badc9b43f92044d0aedd92e0e1c135d8eb679326aa4825afeca104dfc10"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b268762c8a20afe9f6a4b535c4bb53593d67f206f84b38a4e36a7b009c83fc48"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "fd3b58a9598a04644e9425644cab747d37c6b84fe13bb97d8327c0546206cd1a"
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
