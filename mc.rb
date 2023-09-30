class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-29T16-41-22Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "c4b28c314e5dce42f111961a2fe88bbebdabaf3a340ea70bf293d0ae8b7d8bcb"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "240f137c9b0af8e6003ad8fcf9e8653b6f2381e03c7984dc481f26718184e509"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "5b4e2d7785b2d9051f5c184be8b3f6f4bc2fe35ffb2b93a61df99c8b495872fa"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "744af0cb86069bfe1e8874532d73657e5df336695691d476c4cac81a8da2f2da"
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
