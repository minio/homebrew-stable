class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-07-06T14-54-36Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1be98611848d36808dd3e80b672adfb7f55983a4e0bb98a809ce795613350ef5"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "496621f15dd74e9a8780912274f4221144b66affab0f6479baad1f05028cd77a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "bcd54b5bff2ccfd25e68d4ed69c5032a768fb5e4b62254ef37461d926c0e55a5"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "0ebda31d421bc205ad6718e4056546a13cfa024be7c3b7b94f3466a1de829b8d"
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
