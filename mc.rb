class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-06-26T18-51-48Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "faf6d2aa9bfd3c0ecae8888a5111de6a47cf6c3eec2bccc853e12eec8e8fd726"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4f1959cbdccd20b6ff1d5f0603590a9bd6daab78def92a44ee139fd661384209"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3f83d8d798c66593983997c37dd25e0a41915b10bf6b91d46b471fca1fdee9bb"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "74651bd78262a24e52cff870f69f8377cfc8896552e2c51dd5a8bd6ba031394d"
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
