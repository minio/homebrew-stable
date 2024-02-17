class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-02-16T11-05-48Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b2a023dcd975986c56294fe769751475e7625ec420550fbd889bad4e0c5f0c12"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8ee889a5aef9d14b189620f92e14a9a0ccb0711117fc522857b674d65e0b8bb0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9dc744ed44ff216396493f247cd0b5f9bb0e47273e91b18d750286331ecfa4b7"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "32e654f270446525d03482992b274290654283cfe573bbe1bf2687e3e0981400"
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
