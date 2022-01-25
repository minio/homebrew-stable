class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-01-25T21-02-01Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "5899553eefb1ea73df0dea10406548730e07ef97f00946e9e2a5d5fe303c14d0"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4c45ad8945e3bb296534c11d38813dc9109d66b67960cd3252697586529a822a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4b403df80dff7f438c15a4ee6e3dc17675e76a772961390f6c6b75c611744797"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ed3f8307d6d64c5f61d274b7e0ebe9bdbad08fcfa8c0d77adc49a219d3b8221f"
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
