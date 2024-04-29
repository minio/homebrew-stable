class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-04-29T09-56-05Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a1ec90c1c02b5c1c8c855ff12e62b765e24e54840b0865066b3a34bfdad6c2f5"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "90366afe52a07b119d889c891d0d76c48cec1f5a44baf1f5bca4c69fd42a334c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3959162c90a4229ebb5503f742187a0fca507dfc72396d4b08ce55ddfc42b13b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "33f09da6439ad334a69443bc47a48ae90dd3b6cbe70d97738b15d8e2dc70cbf8"
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
