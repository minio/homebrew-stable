class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-10-20T23-26-33Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "89281f0f7760e85478e75f296b55cc4a701a03defdfae7a5399f7512a73e505c"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "5f9a647330e4e9761ddee2112928a5fcd5b68712e896717f6be7fdcc0b0140ca"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "53daeb47ceb52eac1b6b4f3ae63f0f3f4474b1217168f7a3be6d25336ed98046"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "71e30c496e4b87a09f3439b5fb60941eccbeb00b8eb4efe53a27a3dc319595a9"
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
