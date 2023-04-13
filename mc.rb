class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-04-12T02-21-51Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "25a107d13e2f41f047a941fb527787b159bab3e695faaa7e398b2ab95b1c6631"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "7fe1e7cda51ae6934f1023a71418eced20f250aa276f5af2e5d8ae5c619c670d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "453b1285c900f20b24f146ce49640be726c03a8814f0646a67bb6c44ae50a1d5"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "efff3fd87286df37507428b1d348289a7fb9f5b16cc947f7cbc53f7a0285b6a3"
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
