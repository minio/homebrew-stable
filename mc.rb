class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-10-08T09-37-26Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "92bdf8a4dfb241f19ca229cc09c34084502f0a98abcfa7eef2b28101f465fecf"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "a0446b5edf3c215e17683847e5824685a7121199b06059acbc57cc3a62c991b4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4c970b9da5a88b203ec685e025f728b6cf9cf5650baca60f55b57974fd013eb6"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b1f0ef2319c0428f10c04e2338a9a84f686bf73c46fc7823c1bffb4fc1c6d45f"
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
