class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-02-14T21-19-52Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ae32b4f497548fca84857a835b774507904a6affd00f4ee5100ce02bb4238f7e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d91bc76e03bc45e6b5cf1231b69d65241515ff06a691b0d10beeaaa17747ce13"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4f1a210575c9c61f9c4443108f5207a9690a2a8bdffe4773bda5519326ad9798"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a5b78a1face59596ee6c752d2976748b739441c150a9b8e203a63b66346f1859"
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
