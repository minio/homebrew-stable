class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-02T21-28-03Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1fb2941a7bddcf5fbdf54494cab7dfb784cec75f0a2e2564d36849ff78f7b2f8"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "1e039e15c2ad933c3a38866afdd8eca2a73bea4f119311a6f238c0ea148c22c1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3e231dc5166179250e87deed8d2b4090222e93e40a6b89f8d8b08221eb7cca1a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "74f28152cf9198b2e99cad035f63a03aed16413db1c402f531ae359ae3f58b0c"
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
