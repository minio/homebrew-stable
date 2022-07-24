class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-07-24T02-25-13Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8ddad389dfa317d3d9d990a68727c727219329f16a94fd6d5897782dd5845c84"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d75d571b38365feaccb3421eb7824edfb35b864163739ed10df404987f15b8a0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9ab3c82e9b6045b4e2a9505610913cc86c8f987dc34e03343315fd3b2cfce33b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5af402244ed7d9cef433f48be018f7cd1e1c3e0467ea89747aa8d7abcf4f716f"
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
