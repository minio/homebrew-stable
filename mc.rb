class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-11-15T22-45-58Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b775e9e05d4b6704ccda1bae8e70dfc5440a7b8367875b08fad4fb9cb091bce4"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e2258dec592d23e855cba0e723b3fffdb1da34f074cdff7852cd0fff62922239"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ff3ed581502e6b0bdd088d0255331d734e0bd1fc8af94824ffacee15dc88e727"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "d89cc9060b78f6aef16fe42b11abadfd9e3acc6f449d13e9050e27d38b70da41"
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
