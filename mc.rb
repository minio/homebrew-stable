class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-03-13T22-34-00Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d6aac162b45fa7ef51caf59f7d4b2ba3cfb176c860c1c72e126defa63a4b15e2"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c787357edbd9bd0005722d533966741745ac08cdb24d7a12600de0c2360a59ca"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "456eeaec1c39b1f84d03eb2bdf465b1d8a4d8b941daedc219f09f9523c0975e1"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "59c5b4c5fb2b3e6f7829607e25c79f9f90a0ea336b7baba6cafe1286bd1ac5fb"
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
