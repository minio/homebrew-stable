class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-07-21T20-44-27Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "44ca4580fd190242aa7d19c5084db90d4130477346c83968ade24f55e76e8110"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "53fa8ae0e06fa83b5e05118cd212b1201fa8de1cb4fbb0b65da93a12c006a7c7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d98460be38c4f3d43cb48c6405412fa9003e18ec45889e8b122ff6842ac7780a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "43e718fe91eb48e3fe3eed67280a10651700679e721a00a8a24853af9904d6af"
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
