class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-09T06-43-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d9ac65cf1297b4fccd874465ba51be156b9bb588ece382ead0de016d4e5d4a49"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "9f8e3bf654aebc5afc004e0ca9e714e542644de35a2cc30be2c2a24a26fd067b"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4622f1a42ee9ed153dbc516546291170a08d5757b354d033534d701f70f5194e"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "103549376f7acfb98fb770fb8225294c6cc21d973451bcd54b8ac6292e556170"
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
