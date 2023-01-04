class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-12-24T15-21-38Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "0916b5fd029f102a9dc757a179659756defab184609f216b112e45318a866b6a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "7c1a718957e5a81bfc488f489268c25efd7e8bfba797804f7e54ff600f97da0e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "5a29fb81e9a7d75b0afca9fbccfca6eba6c54e7dcefbe8b0ac662bc7a70e089a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "8274f56d3ca69b2538fd818ff53a793c2fe1fc568489d97ee74d463123536aa6"
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
