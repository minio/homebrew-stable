class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-20T07-14-22Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "9c5726b95b8328526b17a7e2dfd8cec52465d88b85dd0f84377210eee010fa5e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "498857580b4cdc417394c08bec3916ce3aa9406a6a1b5d89dd0ab1a9fce811d0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "94fbe41609c50874b8deb5db3d1edf230c2002783d6c790cce7f6949e6cec432"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "175aa191f6f93e90ebfac569671f8ebbbd64fbbd1a9d620f0c2de7dc575f6bef"
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
