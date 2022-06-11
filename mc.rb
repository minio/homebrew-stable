class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-06-11T21-10-36Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "368047b2ede3ceb60612960f1ae712165f7122074f33c21e9d63af4955ac45bf"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d1dfef14bfe51bd305fb987653dd58d56efd89adcf679fe917c4763b5cb3c789"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "c30bf41b3444b830467ad342b2a28c2b223e044a401c419936ae0561ff287350"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "77a784948c3bce2c169bf3f4d998ae1485c060193689268627ff896ddcf9f617"
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
