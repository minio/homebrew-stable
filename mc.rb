class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-08-30T08-02-26Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "e214a46b178d1b360af6ffe4f8e2289160d7847291c0fea757a6e6cd01839987"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "1bf428f10e0d87ca765c806198db57c3300fd399d3bda05bfd462d5483fdbd11"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "36b94ea41fc5b95da5353607c4ae280bae655d61f37215e4e931f6ecbccdbbc7"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "032a755a0d601bc33b055191db16e716fbcef5a8fc245fe4fb5efa2d8a881ebc"
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
