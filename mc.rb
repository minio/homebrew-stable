class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-07-15T09-20-55Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3bd8aa3cfff5ac7326c987155f4e0e78e12dfc430d6b3a289a6b3d293c0f15fb"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e18b9a6cc30f30e752904e4e696adb93297e3166d09e268b80feeda94fb0022d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3a4489114d993509a83b61cb4c771c1fe183e3a07f9903e39b7373f0efa73ae0"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "971683c7a81c2cdd3d7016f928988f244a314702ed230d3348243afc21e06734"
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
