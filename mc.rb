class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-06T01-20-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ef23235b787d4fa3dee1f62e7d88d9ef5280e49754b72014f00f7314b087f85e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "77b6c43865d46da3afee26a7153ef39be9d93a7225c97857b312156292898d98"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "22654b44631e02b2c7fdb23b95ae6aac58d5e6638e853d350a55612e1e87f799"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e373794b30c1da5f86e78bb5383874f2d86fdbffcfdd3c14f56d434b2d1c7a31"
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
