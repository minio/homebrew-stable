class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-05-24T09-08-49Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "82dad88f511500eb27fee1375d04fbbc138671312caa19d684876067c70f2b6e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "01faf381d31bdfc5a3150c084b1137aed16b7c227f8497c375d093e86a7d3381"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ecb481e399310f96bd23ea2ea1cbbc71a2b9f05839503bcea3f572643a01d509"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "83d6f82fda209e32b80d1d36007aa79052027cf0f6088e04c8442115b68c5056"
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
