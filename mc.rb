class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-12T14-34-03Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "bbc5308dd051bc7297d0e620ec55e7f26e0ac96b154934c75dbf1608ca43223d"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "ba7767736eafc97cbd369be392989e25c517cedcfb968f537c6b7e8c7de8cfa8"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "78682be9b33313457c86dbb7c44e0b949c39bfce40ce01c240ab4ce6b355936e"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "bc91b2e313c8715fc84dd40fb208ab5244015d7a75b8c204a5547e8ee18a6dca"
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
