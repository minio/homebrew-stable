class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-04-18T16-45-29Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a6163473fb2f73eac52686c9bcb43ff012bb6bfb8cc31c414505bbcdcfd9dfc6"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "33f8a82edf8c9d2590c01090d78b8b1262149b64f1fc8a2fb05ec8a3114fdccb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ddeb6f33afee7348e39fa540d49b4a54ca220d8cae9cad84c14da78e83a3a22c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ff54d2d6a6fad91a0b1383a3ce515852b2b3901697166f3ce6f17d698f5711d4"
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
