class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-01-17T23-25-50Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "45e5ab71c131b28ce296835ca6a048950381193b0a2d03f0f7d8aeb14321c6af"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "97cc697eeed11b26f840346a4c620f89a4e31bb37eb6fe8221ef4b96cb989c39"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "f2bd4df8f782983ff95ffd228a5fc27964d37e463fd3da03876513cd84012350"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2da8a55896bccb7cb5a29a7f907455c3b1a83eb9f51b10e4b4fbc9bff206e43d"
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
