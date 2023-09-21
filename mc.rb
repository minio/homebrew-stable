class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-20T15-22-31Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d1f9208f5cf2240c84f6eacb53aad6037dcd46afcef6838d5784e98ea04232d1"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "799ce9e8279324417025bf3790754c454932c3b3e976f5a4af31f4b99d28afdf"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9e791e650d9bc6dcee12814ad58ec17b8631fd1b4a8e988d4e6b829402d892fe"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "975ca6b4debbfff080c5ef2cda6b6df70d0057940fa201fe644551aec447388f"
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
