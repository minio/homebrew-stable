class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-11-05T11-29-45Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "e745d9866fc40ff7cf876abeb28e05e153a8cfeba601bcc8daa6e124b81384c5"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "376ae660666d5e2fe0b29bc13c6802ce9a9f535a107aee1f010d41962b40ea04"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "665bda55cc40d5bbd3af14059ff16acbfb06d632b8036c36e66f70d0e6414784"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a2b886f974c4b32ee57c5bf6f3c8070bc4ac8a62ce3556cc241514aeb5427bd1"
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
