class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-29T20-15-29Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ff3754646f6cd0b7393771e2552f271ab4d78249640e8e24554669e0ffec740c"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "0714c5f269e923f803d4b3dc13a3631900d693e7668e8edace645f0402d2682e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "8c88bef87986641f2c144e50b2977774ad2f840441bd2379075d787a40c4cad8"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "58d1884c527435f5a6cf210116329f0f2cff9c7fcfad273f17674b1042dc20ee"
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
