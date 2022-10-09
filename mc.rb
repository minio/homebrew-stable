class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-09T21-10-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f1db338f7deb6c8dbf330972fce85680239cfeeeaaffb44e08a4dff360d3f65b"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "02ee445d809dd5181b033e3ed3d04ca477866dd6f7d52430a023aa66d8abe7d0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "50417635df7582119c0b5fdccb0c4575224c51097007b823819f27b09fb72ba1"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "806c411afcbfbd0cbe5c72902f2702819414929807ebaec796d2a8b6e1dc11b0"
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
