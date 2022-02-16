class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-02-16T05-54-01Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "df301839d37b8713f23aaf63b8d5ca13dc35c2d5f3db97ffb6e9c2018ed0c748"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "a3654507d9e733e6be52af35f18e5c5753e34774d50c046aa87f94404340362b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "0dfb0ad720a79bcb3e4340c069a2d8cbec8b09042cb818a1c06bdc23d8234beb"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "bcb1934a386d646cfcd0e6f2a9f81399dddc877274510e62c3504cf609a0fa9e"
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
