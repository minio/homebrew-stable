class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-03-03T21-12-24Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "860446633a0b3657004650801b8dccbe6cb2066ade2b059e24d8c64b586eaf14"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "baf4b487c96e2fd96ddac98d9a00dbe27693ed406e4619099967212c06600011"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "5be88db14a85a512ded1486a9c44001c612fc7220c4a967aa104dce39bce9dd1"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2a1fb2a0750e311a89bfa10d1dcba13abff3c805e74ead725491d237a4e5ccc0"
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
