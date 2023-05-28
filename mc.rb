class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-05-26T23-31-54Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b4dbd7a1baead1577b38c358b04e26b9500ea47fc43133189a68c17ceacf0d71"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "ffa4dcc4beecf6d236af68ac923c1a99a8696bbf8e254655e87170db3442c619"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d93091e9bfe133aea0acdee026d4aa03c14ce4da74cbdee2eeb573c7062c9f8d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e0bd4d3f86f423aa0e8f230632fd1f47c58ab89051f2a4ecbb54e440d4c767b9"
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
