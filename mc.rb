class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-08T20-59-24Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a5527238433abdf63a8307f1873d284c06efb2d010b83f93bc49c3619e62caac"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8590bc9c66ce47918b9e9f740d3cb92001152ef32d8030d43e25d5a511c61aa7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "525da21b46128cf05201df211ded403f78eb4a6c562b534ac3dbd21be78c036f"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e111d2b4bea05aadbffaa3fc8d2436a3fefedf030cd1318568bccb72810024f0"
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
