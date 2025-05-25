class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-05-21T01-59-54Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d0f43434a6b682d1d00722f8eeafa984e444b58d85fb7c2b09c6ab6f8f21d7f0"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "55d1421e60045e244fd12bf2105af2b10600a9f2cf59fcf754423408b889430a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "0ec5f3f22cec2b7f86d02dff44e2ef9632374b742d74f234bbc3f9d366541ed9"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "fb11c542a9d781fb228de1126c267a7933e98bee831654462fb352d5c9e94d24"
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
