class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-07-07T05-25-51Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "640e83f812702a1408ac337a3ea4881701b18b8734d9148e49ec6bf4f66fff49"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c407e3de28184915c44ef48b4b1486c963590e0a16c1aeb590829821a6b413a0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "482fd8485c580a39e8b26c831ee0f4cf8e6274a4fd695eb1a47bcefb08f2e826"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "205a2dc5a49dc467f78228c43c7d368e376c6cc14492597a7c4fe195c291f074"
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
