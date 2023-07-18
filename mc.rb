class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-07-18T21-05-38Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "de2d2e8c90a3be8ad4c424b2cbdc6c40889d6418233abedb1abf4b71ade07ce9"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "52f2bdad6e8197304e708a588c25f7ee80694e3bb3d5d0cbe8b83cc06b20f6ba"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "14e72ab17e6be8f8abfb652ccf9524c0a4966bdab75a3005940f4f4c736e4c02"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2b823aebe81714c7a8242287fb97efd84030ffa29eec2a795215721d98bffeae"
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
