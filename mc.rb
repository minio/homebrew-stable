class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-08-13T05-33-17Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "38bc36518138a1ff3b093dd4917ed86ccac1fe5b080e1457c9989c25b8414670"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "401cd4eb24e3eb80ebb88ced457997770ba96b218bea24d47461c24cb56885b4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a13cb825bd4fd50a1baf1736d9a99f2dc6e8cb347a4a0149b54d20f278c074e5"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "279825b9b3761e6f39f931bb4984d3bbf664af5510cdbe3dea2a3c9e4b518e19"
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
