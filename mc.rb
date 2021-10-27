class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-10-07T04-19-58Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/mc.#{version}"
      sha256 "3d25ab5da5959fcf2339203881faeaae2fe606f2e55a716b20e13a7628673589"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "100c5b1185e8a28d44fa00d1532b6c2ef44e0c57f476e36d7e7dbfc46ed1f658"
    end
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "aa58e16c74c38bc05ecf73bedee476eafb3a1c42ea1ac95635853b530a36be93"
  end

  bottle :unneeded

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
