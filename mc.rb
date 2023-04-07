class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-04-06T16-51-10Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3795e199c29dbe2edb1ab4c1940b243b3f0fdebe6cde3f2ae343dbb4832219ae"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "4f3e669c86df74f0e745f278f3bfb27bf2710d8564b8fd6455740bfbc2d85783"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "49cb8fe7e9d04193036efb82b2aa764e37af6e927118daab11dbce08ba70de54"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ec8f80a08224d410743d33ca711288b5888caebd566fb4a7f959a8ea3459f0a6"
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
