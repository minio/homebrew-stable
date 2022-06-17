class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-06-17T02-52-50Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "416e72d0386e89656809d9f74f2b3e1f7e20cbf3ab49041936791c5fde83b1b4"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "6921cc4b8a222bcbadb97f5659e866257fa309c1f1bf16db674f3addde2d111a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "2c27cf42eb4e2ff07775111bcad07ef47b21a9ee7f05d82cd1d93f78506ba4a1"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "1a65ed7e58747dcc332b58a79a7fa435b94d45173ae1d4d3c6c76e8be6ee9f36"
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
