class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-01-07T06-01-38Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "9ecbc78de39b94b5ba657a711aebe02c690c98af9536a5ec90894bae8e6b74a6"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "20f906bea8a5eb462d39e7a6a473de0194740ce52e27236898997ee34944d830"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "81ed0e6f22dd667e49de805cc5e4b3d14b3a9e5db1d5fab5b79659662fa85bd1"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "65efbfa31d85aaed8cee12e502b04108bd908d207a0527942c3735fa7d74c4f9"
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
