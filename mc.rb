class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-08-23T05-45-20Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a247212e68d439f9c52d125af4cb67a4f13e5b50cefa1d7235719d28af0c9430"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4bd3601c4052760176d8e5a0784fe33ea488fcfed68d76a25a1368e7216360d2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "dbb7f904780dbb9759239190e67dd067bd2e1971883baa01fa5c265917850dc4"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "3aa40368c580191a0479629387bc492410bfb9e8245bf0b58d04df91babeff2f"
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
