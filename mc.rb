class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-29T10-09-23Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a4e83230fa709980f6ad1dce8916ca528371891ef2ae3ad38b9d9607e4fec8b4"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "3f7f4e9160bd856236361921b16d08dce0c21278f7898475ef8f07d86c58ce61"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a5df3a732e9fc0a8eb92ff721d46d1afa56c53cffb387da4c05f7732a30bac44"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "0753e5edd0de0ce82fac495af59b2c2e34ba1ce41fd0ef5ef32f568f3379616b"
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
