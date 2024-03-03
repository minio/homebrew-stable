class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-03T00-13-08Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3cf39cff2fd7db719ec5b7bc4f274b3147d9a0b81e22cd5526fc992a0aef996e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "660565144d681dcfb3f550359d69ccda1c9374e51401307f43456bc36a848c6c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "c4ee45c1a8120c3a5220096db2ed165c6d638d355b5492f23b1d68b9ab34555d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "45363a370188e15ecb53f8b8e6f1c78e2ecc0b0ec42ac9f9627d09eb292b63fc"
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
