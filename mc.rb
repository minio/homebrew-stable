class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-11-10T21-37-17Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d453bc84f79357fd194d5ea61e62719e287259167d5ed7c474d58840848ab860"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "93d67906096df1952392395519b5385b445e79702b6808af3969f6c3e9666128"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "cf23258c5ce71862d2e6e63aa07ad4a220ee91064de7349eb72ac929743a7552"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "be8220626a9fee2928608003030d903f824273de10da374fc4b20b8e88eff4bf"
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
