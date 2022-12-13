class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-12-13T00-23-28Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b85b6d768ea59476fa2eb7466e55a61ccc436275f8c740c996b9b91e64a84be9"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "84014d7ff27753fdba08979f243d215274cbbb1397b9207053ae3e5e88a03e98"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d2bc38c5173900b88eb61f4adabdf13b72aabd25d920369e5d1b48ccd6fcf6aa"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "47069f02014eb666680720cc7982d0fcbe96b4878abfd0139b0f0cb39b529874"
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
