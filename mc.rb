class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-05-30T22-41-38Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "eaf49d7b8a8c8736762870608d643451195d0e99683509655938fe37f80e9efd"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "1f9dae6d870f889f4983490a44e42e928accc095f0f5174991a363ac72f8d605"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "e95eb04458ba6ff10dc28d2c5c54e0fdd418ddf5009d30c8dc57bc499202f0df"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "0ed985b1d4b0af505b04333463a9dbd2d2b70e151ec4951dbef49054ce725441"
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
