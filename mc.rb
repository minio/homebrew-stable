class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-09-09T07-53-10Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "21d35050f2d3f69a36fc126ce5e2602ae24c30bf85386de40d997ba1f0b279a1"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "a11f7dcce5550cbd6b876229adccf5c635a9eefb29ff0c0de87f2dfc476f7610"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "964e592c776be3571e9fd13b8997402669c82761d6cd08b61aee4a7ec1efd6ce"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b80afa1e7ab16c89673453a29c6d10de88dcd6e3c1db8d327abb2cac471c8e70"
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
