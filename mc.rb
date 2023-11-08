class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-11-06T04-19-23Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "0b111d262a056c9b7456e6e712dfebff0401608420176ad69152ebf70a50f645"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "88263a05afe44207a87a02fc03e28d4b06fb6040924dcf7147cf0a11064954d2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b2f132a903bd4c90d6c19aff4b94ccbea05a3c5fa2f0a70ea094898f882065fd"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5384bde1bc21c89d6c9dd303d4b98c04a3c9935a76224cb046c79d6f58b99118"
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
