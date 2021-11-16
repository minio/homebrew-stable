class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-11-16T20-37-36Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1c9fbf5355620cdf235af7123ecbeb0a21cf105351d3487c0a99d6c6366469e2"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d710ac9a9cc1257814be15ac9b8f394907352c3c4fb45cb771ed5f75f6989ee8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "0decbd5b873bbd389434dec92e40fb4a69482c1301d2ffb027573cbdfdfe6467"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "002871b96bfb0da15d6fb91d7f92c5fb18f9c9854c649c353ddcc63f3e0c0613"
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
