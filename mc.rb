class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-11T05-49-32Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "614b6e3a6cbe0fd5a697ff710792044851c0f20099a56ab906eb3464ee751f55"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "5b635d9f80935ff978ae50cd36e4cf0537b2456298e22fd68d37536a05c174c8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "e57a036b7b05022e0c1616977da55937c6d51df1886f4a82dc1218528cc73094"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f9e446f5947f52d614d907c29caa974710b134e052be8ffbbdb36c98b328ab3b"
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
