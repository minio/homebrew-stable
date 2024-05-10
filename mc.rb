class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-05-09T17-04-24Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "91befc313e4ff0f537990273e873856d9292486e70326374da2450bf9aa96259"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "a3d1f69cb97411c890151df6b566393e329c48a7d815be83659db4e8292da273"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3af6501fd9b36780ce6715290f84458480eada7ff4ca4d26a593ec04592bbf3d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "360196aa51e7664996abbd3a522bdf4749188744a4d36d9bc0c4068d7dfad9e2"
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
