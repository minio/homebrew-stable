class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-03-17T20-25-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "43cbea6ff950e3ad8406b4ec1b7c43f983682d984c622ef4652fb6ddaf1ea244"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "7a356505f999f378002c7263c934fd57cbbb48d1dbc982adc2eda770049a9fbf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9041bfd6024eddc8a516f911633a21cba224f6b746fda95dcdf99b6c945a75a5"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "293815cbc9ae3ceadee4f47941d8ffa6a53314fb0281dda79dc6dcb64fcd634c"
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
