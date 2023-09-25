class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-22T05-07-46Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d9bb4a067b02cec8a7bd10c32a47ca6b7665d184380bbbc029ce733d85e28d2c"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "6d21f6f48493be4fe093b034780b32299284bee398fd59f91a937fd973dfc9de"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d79a951a1f0593a633721c9ef8b4a3827f9555f8bf21d72d897729501c9f702f"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "aca0ca976ec2f51480f1e62e93dbbaba18b71399ee65d6d0430ed31afa88fc46"
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
