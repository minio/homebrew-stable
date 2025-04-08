class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-04-08T15-39-49Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "0ffce1b14eff6b3d410ed400ffbf0530ff4b11d8372115f1afa6f9b483ba5a40"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "90407d70b69de8251731ed8cf644dd78836c49f1b3f559ae0c2b70dedeaf79aa"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ac7448b6d3188fb94cea48c762d700584e7a0e467e21e1be4cfc823755c026eb"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "43d44d801a936e48390c8d2dc02c1c1cc1e973becbe71897f28ca06a9f456489"
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
