class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-28T16-23-14Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8b6b256a34282603c308c9190bbbd87c00b134189d3b86cc84e77bf0a19b7e00"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "956717bb10b58c92c0cb274100b81004fd45ce2209c323d729f893cd100a2d8c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "683aebeef6f8e0d18fcfec152e8e8d0f7e7e8fa5859b5ea2bd2414280b7398c6"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "fc195c3ad5c19b91d96bbb42d79af94173aa491ebcda9ca372c4f382546135ec"
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
