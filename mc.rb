class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-02-02T02-03-24Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1886e9564991272c27eba2dd416a91a5fba40fd650155a9ae24896e0b4fba8b0"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "772af0ea4b2bfb328ff645300213dd09a446720ad2bc8d09b76334add208bb41"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4b0e98bb6edd44226d8f1b5be49218c2c0ab7821c6cc0bfa19c882163578c048"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ef752c96e214519537726e0876955c0c8e2bca27d66d7d047f2c61a9e50e27d0"
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
