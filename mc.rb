class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-01T15-03-35Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "cc789c1b121e01f46c46f5a54a1474de80272a2428ae628214bc5d3083c48312"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c27b951f0b88dcc7730217926999b2bced8343aa67324f9fb363f969f2323f18"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "195dc44e42e08783c4b501749d21a6dc7979a15474cef0770fec8ec76756f32b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "08e64861007b6ae9206a4ebd24faa0059f252b95aea936a396a44b10bc069d86"
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
