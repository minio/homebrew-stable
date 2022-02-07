class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-02-07T09-25-34Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "2b8a5353228eb1f16b5d82bde9a5bdc7079cdb7d628705a824faff291f4dd4d8"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4a3ed665a4cb8fd22dfd498264a81681a6ea8a09487bb988a89f5439df957b29"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "2a50228ca99475da9fd84224077e3b4f5c96a8bfa397aa6ad585399085a3b03e"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "bc70228002378834f8fded292cd7c8d4d88e587f7e35b3c6742cf6744e8c8569"
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
