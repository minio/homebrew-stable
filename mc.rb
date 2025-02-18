class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-02-15T10-36-16Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "c5a594cb0d57e5db46bbae1ac6d26cc783484fb86445910854322958df5c4f36"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "9f3a32568d971e165d79cb61400b279d900839bf00dd8c36be24ecd55c717cbc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4ad4e79e05153a6e8c3dae84e54a4bf16df403575f2a19cb7d688d6594e3d553"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "7a03ba39e158708a9e88f1bf5c346c6651b15c784e4b2c7150b5b5f282f43c28"
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
