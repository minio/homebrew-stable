class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-10-29T15-34-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "bbe03d35816c7fd5e0b32bb20dbd19f87ad268baaf4600661006f18719ffe110"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "f434df5806d60001105f0c1b6579c665e7b77c8574b40677c4ded1a95a86abf3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a0312659c887da8e7f2427a7829bca34cdd29bd4c4af19bd7c4155156d00f543"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a8a31621b4ad257583fb569fe31cfd72cf40e0b9b636971963c4815852c26914"
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
