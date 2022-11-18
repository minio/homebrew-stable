class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-11-17T21-20-39Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f211ddbdce6c7a088881f4b0ac15d9961e14978461445653a7de9d0862bbbd8e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "742c6ba049dc401afe93924d1bb8546674468ad5ecf64f1b8668324851ebbbca"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "08cff3d6a9e7c9a7d6bb156d43f50f3bcaedd7565c65ce58626fb549f1a6147a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f3ad04a3a103a7d3781b66f1f34a1215f2560fbb5a9e49070fe95ef3b11bc820"
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
