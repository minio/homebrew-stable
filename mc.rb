class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-23T08-47-21Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ffa39b9116c726778d0fe01e4e05c3123f8f59a354ba43279cdfadef2ce83ff9"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "bb18de86a404cbc235f1c444efc18fabbdd8153288eb8eedb00518d3342f69cd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "7573900469121b4f151b41c68d0b68efcf049f3cb55cb7eb1b2f335e9a87d8ac"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e843527ecfe839b9118ad404b30daa517cbf16916bde05f17338690122f8d3d4"
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
