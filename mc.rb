class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-12-02T23-48-47Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "bd88eee9bbae9e3f4414c25c33dd328bb3bfaca2407536813afc8cbf9df01b91"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "fec1b823e369f803f1f42e5bd4f11d17bb26ead4450f7991fea126afe281cf72"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "e884eac71882f16b740f1813a8256a16d7b9a483516a611819215d22e0e52a04"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ce67aebec4b3cbb3bb89a51719e71248c05c0bf34b3e40a1984bf43fc324c9f3"
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
