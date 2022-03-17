class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-03-17T07-21-29Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "4ab90d9e77a4043140345ef954488637c4cdd1901f0692264bcd742a22de1699"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2230298cad9d3b0c0587ec258122aed7f1f1b7d8d4570d2b2a933696f1932725"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "dda708550fd41bc12500f7d231ebaf918764c4387783c18484afd6280720052d"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "bf81be6365e083218b94d1b0948158a2eb1098eb6242262d375328697e1d6e4b"
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
