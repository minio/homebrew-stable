class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-08-28T20-08-11Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "4db8736ae093e52613116d01d0baad8f5484d6e860057ec9568274f3e61a63e3"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "5eacb1f03e960ec50dcc6947a38ca59e7774238b0e917c19fc1afe0060ea9f62"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "05d98a91099a560101cecbf5b9f7a3bc2a491ae15caa3f73a56f395df38fbc5a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "21b409ad36e2c9384fc6ec5d4d320512420bab06a3ed986e15b8924ab32d7326"
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
