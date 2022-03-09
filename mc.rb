class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-03-09T02-08-36Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "6b65bd9a2f781e01865761fd5f6f093948e8411456a29777b434a2780c730e14"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "86e95106494d6c486115075a6147b599aa540da042866369dc9b67bf80c4dd23"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "c05f08b6e18a5dfaeb8278569fd644051178f9fbcdb12dfe782ba4f184a93e6d"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "98d469d63b8cae253241ef53adc97887ca571991c80a23e0716c62de056c358e"
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
