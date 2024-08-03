class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-31T15-58-33Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d5ecdd130c4078d456699fc9f3bd809c32c5a5eb7053c5998426ed14a6d06464"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "71ec2661fc020bc7981a348781c36a25b2b990e2940bec03d1f7ad2feedc2421"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b52f69f533e327d2255c68709671a7bc3cc4750e578c2c195b79dee4054b9f1a"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ba58692ef92ad5977838ab41c5a4fba11d71bb0fd59cec89ecc1fc774bf93786"
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
