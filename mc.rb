class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-11-05T10-05-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3d25ab5da5959fcf2339203881faeaae2fe606f2e55a716b20e13a7628673589"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e97fde6e02954b7bad4187dce79d9908e2f18e0ceb92bb17ca165cb71aa60f08"
    end
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "9f5ad72fd93678f9f756c6da34a8d4d1e61f7356a96ee327c652ad765975d2b2"
  end

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
