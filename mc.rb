class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-02-08T19-14-21Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "527e9523f0268e864d12c48076a3c239057596460b6438a0d7cac9d5e5541bc4"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2b3766223e8a59a689676fe9596ef4903b70728ad81ad3dd03510ba02347c54e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "1f4a993ed7ab1dab2c1edd3a7d35f3c5d8406e6be74b62607d6aaf3d27d88bc7"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "d9b615871c9d2c3ffdd89321d44d664945e67d96cbf726643f7197cd402a6a55"
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
