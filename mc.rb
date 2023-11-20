class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-11-20T16-30-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "e4fa9685de1d357ae5d4a011f19d45a45cfb9e029aec8f2e067643db6c8ef020"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4ccf87a4727b2373d3ca5ee6cecd07e0634ede01fee691aea4e03522eaebf329"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "09816180f560875d344dc436ed4ec1348b3ff0c836ae9cf0415fef602489cc11"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "fdd901a5169d676f32483f9a2de977b7ff3a4fe83e254dcbc35e7a1545591565"
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
