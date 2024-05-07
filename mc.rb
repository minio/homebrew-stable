class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-05-03T11-21-07Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "c7ecd7b47122f020aceb767221b35efed501a81e1607ff29268126febb934dfd"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "1313bcb5deef9d73a739f0d9c8393957d24ebaba2803800a3182bda7cf7b7418"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ed7156d3c9e03cb8be66ec07337023315ad9c67bd8cce53d549862ef5d86b255"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ff8ae3d45092b8262c8c19e748bf5a077b04cd93d21a2f523d10e90482755ba7"
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
