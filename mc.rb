class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-13T08-44-48Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b5425e0fb46d3fd297d98131fc3889768d4380a51461b4dd8374718bd86ea3e4"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "71ee1831e5daca67ca7a9ea4ea578309d9012d5b9fee505109d2e16aba5d3382"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "f030da851475b16c82b5140eb49f67413bc0be5a295e5075260dd5750df96933"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b1292daf9bcf97c8cfb4e567a03e46bfdb0f481539476a95ed16e3344f2e1987"
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
