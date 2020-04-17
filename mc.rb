class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-04-17T08-55-48Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "675af1c6ee08f21258a9e601fd3ecf5ec06eeb23da322229d08e635bf9d089b7"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "5de3fc5bd45f119437d877abecc40bd1dc7e584d1bf7fd7f12f6b3ea4febedb9"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
