class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-05-04T06-07-55Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "0fbf5c8334272bbd6d44dde2eac5de9c195824f4cd6c68529a5087209fad84e6"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "04dd91f838d04f9c7ef57509f2e3a19d2e3cf7c8ff14d3d9656ccf52b556102f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "f03b7a078813e3826c4bbf3ce9cbadeb52072f5356b0a7d269eb0ae74f7b6cf2"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f207b7fdf8ff126caf4c26603de752c918e3b8441040830dd62d749b22895d2d"
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
