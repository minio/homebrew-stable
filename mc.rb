class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-12-29T06-52-55Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b89b281f92bdb65710ad3929f5a09b8ea19b9b636a6377988f00aae4d65ee92c"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2c6b40ac52607d876b936f550ea47800d6db45bcfee3202f196e640ffa531598"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "74cf2d7ee67a8e82d8fe3f9cc74c9f3897540a78dacda050819bdaad9a84e476"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "7aece18d4b6496a590ec7d26eb84b08b75a651d44de3f5c64565e108b482be56"
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
