class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-10-04T06-52-56Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "6d6c1709eef28fb09905cd89e0622edf0a2941080bab0b13d46032e6019d713b"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2cd9ce96bf54c88c6a6b7b905f16ef1a02d83bc5099b55efdb36f1b1c0692f5d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "127bff6c2e1b4693c9e1dcfa02ae46388bd2c8b60a354bd56c23caba219f40de"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e0052ea1c20526d7ee715045ad184f5450509afcb5cc7cacbf7f4c832c7957fa"
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
