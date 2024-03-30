class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-30T15-29-52Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "4a63a33220cd0fcf1178d530414dc7f8f9a0b1b467e64aaa4b52bbe615bef860"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "bef59b2b0544d8b1b48234c4492ba72c5dd542af9fc0791b343b613d6b07d6f8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "bd891c97a0d0947cd0f92b8f0f655a1b6839b0d8d34f2adf5ddaf05397052813"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ce6290d9b8b4d2bc833a0592bdc7243785afe05431e7adf378a239cf7e3eb8a4"
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
