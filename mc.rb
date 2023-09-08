class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-07T22-48-55Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "53bb179838814c8e0f84b985e59670b7555b4d7e022c1dca517e4742e5d2fbe3"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d7ce26c52783b5d1f4f128a3dec29ba7faf463d680bb9e79cc723dafbc3b839b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "6af5567ae0cc2195a524d62655344dfdcdc677a6457f192cca7752e389898403"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e3beda5f8c7622eb263a0218d07fb0dabc11c121d1d8a086c6f110b905faf351"
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
