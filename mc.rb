class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-05-09T04-08-26Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "c7f4bfb0c75aa0cfd23326594572a7e106b01c730d10cbca0d9aed1749b4aad3"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2f27193facc4ba6a51e881158c6471df45eb761f8243e98819144893fbfd1ecf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "695d80ed00d1dceef6f9113daff1324dc0dc3f724d1d4aa702862c7ce8030818"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "032941682f0dad14ba756af0377bc1f517fd475c5c98e957a07cdedddb9b1d31"
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
