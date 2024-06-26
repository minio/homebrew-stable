class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-24T19-40-33Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "cda46afefd128265a5bede15465720dd7be73175638f09124e39e11c8ed0ddba"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c840f2f70ac428d1696ceaadaff6f3df6676c8aca7dc1c95442986155aed6a23"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "7f3a5c40fa82c642a3732e4cc853ad1c7561283990e92cbc454bdf00241d702b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b0c2871b3bb933e6552aa56eb813ca071fde1281a44006d9dd38a6cc5f3afa7b"
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
