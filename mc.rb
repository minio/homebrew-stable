class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-09-16T17-43-14Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "668db3dd797e4f285b33ba652c6de8f8edc4bed31d74d9f17f3c0ab829482c4d"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "0638adf8be9052fc04a8e08e0df5ab516c11c16a67aa62b14f1c653b46fdd0cc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "f4a269854283736f46024e73a35a3194f8286067a36877f2aecacf3bf6e41bf0"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "9a9e7d32c175f2804d6880d5ad3623097ea439f0e0304aa6039874d0f0c493d8"
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
