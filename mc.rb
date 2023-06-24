class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-06-23T18-12-07Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f1a335cedc11161f4f142f06a8b2cecc8373dc19b33e7ea2f6f95c63ca175180"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4668b266575a794befc7056add8b7a8b4fc6ea9f217575ef43a55716cf578369"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "dbba8d95626f5fd352b494b01c2eb5ff09d7f0e1ffa63b3317e802f55414d2e7"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b3b0def285ae8ff6e8265e860a59f4e59710fe3949ab15cdecd6e21c498cda4c"
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
