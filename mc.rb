class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-05T05-04-32Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "58b1b40ff2b65817d71b1a9c1e21981c69c874f2015b977f2a0cc0a1edf0e6bb"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "859fcfc62ca5a93756ab94888487823dd98d2ec27fecbd951577b712764db610"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "0081df49651a6c4e4208dbcacbcf401a0f292ae2001fee95b71f0455eef8f339"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "6148271e14cff921cca48eda7285136494d4f36ce75f3ff84a397dbbfd328bc7"
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
