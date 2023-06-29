class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-06-28T21-54-17Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ea49c142132dd47ca3ee5998312e98f65baff5d10a3aacbc8eadf64100137ba8"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "bc4dc6ffedf3eff9610feb33e7b15a312d576d712b11e267723537ea0afd8237"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "98619d9d9790061661fff56a9ad3841fc94050b61e27d169b2af2f6abda24fd0"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "10318e03ef7e25d2715a0ca4e58d334449f36ae7a8221bdc1d71dd6f60d4affa"
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
