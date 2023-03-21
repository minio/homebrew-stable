class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-03-20T17-17-53Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "316efc53060942ed354f40dcd092a2c7b8f4b230a0eb8cddb845cc462dc31bfc"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "de88ab57744d2332894228a7b68b5eef8012e2bd9f298ac35fd1b6f18cde2fbc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a47ba894c3499fb59e89ee5c05cbc3fe3f902a0fa909184ea60833b3f1877813"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "67977ce7897b6c365933694d529a636173bba425e6477b365740bdf6594ebe28"
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
