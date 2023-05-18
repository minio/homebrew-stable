class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-05-18T16-59-00Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f474961ebc8df77dcd648004756a6a8ff3752b62ff74a88436bf9287241d4317"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8539f6a5b24ea5d8cb3f9190056488f549a9e82c46862951ef4215010c692aff"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "37013f6a796a80e2f09177c4bb540dfcb1b87186f36d14a5944b59a9f4428610"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "9649926bd73c7c53390f6e22a34986d8bd23dc589d31e8b459baa94d75e49cee"
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
