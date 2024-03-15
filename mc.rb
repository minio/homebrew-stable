class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-13T23-51-57Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "634bcdc94e49124bfe7bd8adba9b7835e88326e5786cf426549c51c0f83b0b7f"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "97d1a6ef3ef82d9c3f75e46abc8d486c1b649bbeb3baeb122c8b489cc0dfb568"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "10a2a166fc31f7899e330f88988036fd63ce44bbd9eb1a900a7dd37d69079bc4"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "9f47bf1fc4bddc5c4bab08547adee9d80d2cc69cd3a79b7c74da016d01b5a3b8"
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
