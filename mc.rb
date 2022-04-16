class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-04-16T21-11-21Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "c1da744ecba745077f4de61feee6f7b30b9b35fec85ec734188e46cefe9faef0"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "071e4bce89b71044725254f61389c2fdd207d9595233efddb1699fbc9bf01d06"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "1d4abc64870a7a149735b1322226cf07095c94877f5120bd29f75e314b1d1b1a"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ba30f3907a67fc769447b3f1c9036781cf2c9ac9d4bad92e1b403ae28a97e9e9"
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
