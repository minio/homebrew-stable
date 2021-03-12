class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-03-12T03-36-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "1b6169c855e6e14ee748368fc5f591da4a670d600b3768edf3affc9eb6e58920"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "8296d4aa02a4cd9cb812bae4d0f65a2bb4003e1475192dcfc1fd42a726250ffa"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
