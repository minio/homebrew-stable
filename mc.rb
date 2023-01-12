class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-01-11T03-14-16Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "14e59ff03377870fe2f3250032aab94d27889284eac76e888770ba83bf5b5005"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "daa5a7c50d72e0cf2f8a400a449e756729e580314694f603235c9b594d8ad3e6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9f7eed268bde082e2dbf382569f97c493de392250830a95f87ecd36411d4d77c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "9649628b7f1925a7536cf3fd49dce3fe28dc3c27165291aacbb59af727494ef1"
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
