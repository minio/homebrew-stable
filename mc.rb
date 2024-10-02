class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-10-02T08-27-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a8cb22c6538b0f99d0374451ab263d80781b16e4dda3008dc8fb9ea5e660a6e7"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "164bcd3aa7ffea4972fd28aa6ff42987b44c2209ba2dbe393db498ce38e05183"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "bd8a4979facf707d656c1197a50bfa620ae26b215ff20923517a5f43f9097ffb"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "49390a986d54656f0180d59071665272c1e65c7cb8434fc40703ed3dbe8d3cbe"
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
