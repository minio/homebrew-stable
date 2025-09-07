class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-08-13T08-35-41Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a877fd0c183409da9f20f9d6e1811987298bbbca1aa03428eebdffba79fb9445"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2862c79cce11b09be9a8911a279b2e9465bebf74b9f01abca9c348a0d795f0cb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "14c8c9616cfce4636add161304353244e8de383b2e2752c0e9dad01d4c27c12c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "01f866e9c5f9b87c2b09116fa5d7c06695b106242d829a8bb32990c00312e891"
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
