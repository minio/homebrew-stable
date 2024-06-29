class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-29T19-08-46Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "57150d748026a42d1f35c35af3080fedca0ed638d2e9cc47aadff3b6eec8a83d"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "3b3fe3ae3b03f3786ad7c7aca82ad74f6f6f76d0385cd06aa33e54667d7e9e20"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "0cd56e76cc30534a5b653fc652517fd4c761ab2abb4286c9175a38181f5c0ecd"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "91de8411f6bbc68c2327ac4461c53f96ba170cffe31f9efd27c3303eedbbe9df"
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
