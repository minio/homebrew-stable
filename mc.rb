class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-22T03-39-29Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "43cca2331098cc1d3b605e23da12900d6784b4e17101af9ba13ddd46a3abcd80"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8b1c2eac96c21aa14403e6b2cddb6141be47b23086a5115011aa00bc3b615ce5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "2b22b883a289a3e2681482408a2ce9cb9003b5bee2c86edf021abb2664d09e41"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5a724b3f76da76d5306538a55993a3619fd77cf71d8803a214f9ff79fc50b7d0"
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
