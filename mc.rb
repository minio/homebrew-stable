class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-02-26T03-58-31Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "bf07d80ac498ff1e84d3bc281ea9f20017de6e004c18070a282d0898577b09a0"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e51ccdb73f367bbb5ab522e49ead59f5ef247217bff25ccd73a372de8dc22aa8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ddbdbf3a6e0f6bc602e3264fa525d9a9063418440318f7639d8b2110cf58c06b"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "897bb9ca1fd026b02dda711b550541e28591447a32cb4d2584cec67934207256"
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
