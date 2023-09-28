class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-28T17-48-30Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "fe1d6d4bc71c09009fdb8c26917f519809d7e27ae4d8668bf184524e4921c56e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "15d88eb11c3ad81a0881fba5a3a463ad508fb497cf35159dd23002dd6d285a23"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ab6a3a9ef203c451ae4011c091d78ab0951d6d1e39e19502cdc0e64b34996d0d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "927f0d1eb40db7542d0f921c5d3df2639e850dace1c3f0381db69a92d7f77d79"
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
