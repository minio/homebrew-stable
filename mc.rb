class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-02-16T19-20-11Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3a6afcfb8a83a795e3bb26055359cdf8ca962ecd58ecc3cbdf400a6f25dcbb16"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "92e851fe35ae1dbcbb6f694bea0c6f9464544173862b7dd5c11958306bbe2650"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "df56bc161266efadc4cb722f4afb909738ff1eb5200f1446bcdb75fe4c272374"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "04aee1a04a513a293af5ceff699113c791a54309cecd97b2dd71f111dcc45f7b"
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
