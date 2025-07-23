class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-07-21T05-28-08Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f72ab39389f6b8ac7369fa1894b62f34a9eca230c339c0b3128a7e45ecfcf139"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "94eb15ed9dfc55d51750c8aba6fe95487e081464337eed6813a34d85e7c4a0b4"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "62a7d4cc0ea37e7a5b564e0991057d4fec2a563566511fabe4ee5c1568f5e00b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ea4a453be116071ab1ccbd24eb8755bf0579649f41a7b94ab9e68571bb9f4a1e"
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
