class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-22T20-02-49Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d1c90c48587ba42c6e7434cbefbd06340aca8eff4ac22dc6d41e33ba1a7da103"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "13ffc00b48b7699cdd6a79c89c13cef4520a02247e940e413311e06ed7d8fefb"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "6de45a4a4d720f20d372b50d42c88f9e54af223d99ce366386f12c2a6077c9cc"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2ea178e6d0dd55a6cf39d90b19daf7cea554726990bc318457e271fc90b4e870"
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
