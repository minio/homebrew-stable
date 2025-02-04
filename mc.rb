class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-02-04T04-57-50Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "2481f855db51984f5f730aea3936c6a0da26a192245e4dd0df8af66ba0e2050b"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2f088f2415042f1af8471ee0303d3d578464a2d188df04b2e98784d90a529961"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "8c545693871747c09a7d84afbae92a7350c3f537eacceee9bad18c8473541ef9"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e9bb8fd96e469ab40bb624fd5016ccc8fa20b9244dd3949c20fb4211c6d00258"
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
