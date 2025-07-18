class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-07-16T15-35-03Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "61caf3c492ad86601739ff2e8278bede1bf5bfaee5b84bfc880f6549fc645952"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "25ddaea38645b7ca73ab8a093fabefea8d21918e743132caaf6a5f4d1dda0703"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4d5f12adc96af56299893306f832cb49fd103cdd844a6a91a8e5de0592c74f5a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a5c3695b6f76ed958c0f099795f32091fced0d748ddc749c8b24e07681bbfbb9"
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
