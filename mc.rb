class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-01T07-56-14Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "e1a235f6e0113eaa3bc7887197ed4ad82d7fcc1b0af0df1eb0c91e234f703b69"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "68b9aaf2d34927b51343c1d91c5fd782baa2e0b358a8a6ae3f984db2af5fe420"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "2fe1b3c527f4c573ce3a70a4a40a7db92ea572d58e70d52b88ae1f2ec5ad0773"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e4c75512f6113466bf343f4369960fae0b12245523eeccb8188b24b52f589cac"
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
