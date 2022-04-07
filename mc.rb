class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-04-07T21-43-27Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "caf3f0eea158220f75a0906b769a5d12bd3567ecf5f0fc9a2555ff220277141a"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "57a8bd4191ff0c2c72ffcec3cd4f7128214af58fbf5499ecbdec08066de508ab"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "24b25016e7b0aea34d2f91bbb56649928e95a4db3ef47f3c7d2fa5076c317b7c"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f8391cf4fee7f2caeb55f78fb2666f8ffabddd385c8d8db8b43d7079f3b45164"
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
