class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-03-23T20-03-04Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "4b8c6da5225f30a5d068b78f5f9543847f98c2e5e7957712c11184d26324e809"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "fe72274e85fe3addcef1d7c0553f60ad413539fd7586b76c2e7129496739f1be"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b3abf4a80f16169855d53432158dd4c74ed197147e228409d835d08fa31c59c3"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5de4aec1fc6c6608723a1d6da988350c876d5eb14538000ccb4d3a226199ab89"
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
