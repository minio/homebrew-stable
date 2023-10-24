class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-10-24T05-18-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f1f124bfddb9ff010dc26db95bc3a4d62ec70da701d2084443e4643931c1f81a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "aac96dd43be08838c89fac88f801cc2704bf583c3007bd46ce351da9b82ace7b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "aae7e58f2bf7cdc879b02d809805464a63bf7c01d4e7e392700c59cf59f5418e"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5f12926b646b533cdea1a548c54460a4dad78f27b8b17d399ba02ff4ee368e4d"
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
