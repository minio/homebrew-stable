class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-11T18-01-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8328bfafd118161b50f540bc70265d22810db362d0fffd69e59104f7ec7bace8"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "36caffbc61ed6f6994b4535d0d718f88e62e949e5134b2f682660c31a4f73748"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "dee9ea168902083a9db7c0a3b655a40c47375147bc71d84e57496be4b6576166"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2c2020b9b168cdf62119a1cfea1996e3d2711e29ffce0acbebe5809c48905f13"
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
