class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-08-01T23-30-57Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "cbc5ede5681a29ba24b26b7585a2599a58e584efa704afba1d53040524d585fa"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e4e1f0ae862df4968e964deeef6e4ee8afc135660b3585f1777673d81db7e3ca"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a2614e29056fcb065de02f445cccd7101ac7b2d03dbe7cbc209488f078497c31"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "41824d9bd4dd9a4264b7645f8b493fa214ea78bf83aa683e43979a07ed5b34cd"
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
