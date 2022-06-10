class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-06-10T22-29-12Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d4de6d50620d9775ee42f80ed5217ca3ee70af33c3651836d1b6df5449ff5179"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "90bdb3ea9d8531a5db565e68dc433c869cb6033b6bc472a93f58ab32cc51250b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "0034034cfedb007cc96692fbe8a39338e351b96afde6edd9ff2b44d849cf2c6e"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2856f4e0743e5599084ae49f51585e8d2378cda684f9a8fdb0178f266f0e6407"
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
