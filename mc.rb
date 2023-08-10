class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-08-08T17-23-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "7de0b03bbfa0aa1b99bc175a5777b8dcc26d7d578bbda4ffa591321e972c9083"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "49f9c7f26ee285139067d8c87beda70b7930a6df202a7b6f3f5c7fe93ae18041"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "5b1bf84079f83202bb508bc32dd13d1b3503ffd1ec035e70d6028036418cf8e2"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "561037e88761b17e558a5d5015186636b779965f0075789a15f895304c42991b"
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
