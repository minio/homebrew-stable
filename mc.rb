class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-20T21-07-29Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "06a415c9a6af2512d35dab8f1dc2c843c23fd0d3b4966a97ac8871fe423a38bf"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "68916dd9a58393392e0cf33e95137a9f7389da1d5b00a770773ccd0622e7f049"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "64314daf36cb7079266a01d708ac6bb21104b4e800dfd96d255029cc655acf0b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a7ab3030d0997d0f489da46cd7e2506c8510990a35deb52950c44f1452f69368"
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
