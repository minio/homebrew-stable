class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-06-19T19-31-19Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "6b163c430ec35979969ce166b078284b5c68fb41f357c6f8d10716d812f255d3"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "180a4f3e22b81829f935360bcb6c41b841e09f7904dbe03520e7b4d0b3b2abd6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "25ce3ba4a85ce2be5dcb04a3e59f13fd8c2640d3e7eac49df79aa7d694bba25c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f615851413e376dc9cb7cb0f72eb94bb9401e680ef1b59b1f7d53254b134c960"
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
