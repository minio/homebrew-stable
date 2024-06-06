class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-05T18-13-30Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8904b32188a9e9db380a715a9c1d236f6a03c5d437b5b33ecce0e9967e15be2e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "25e8647bea0439b53c6b64989e10edc00299186ed9f5ce3b8c9a6170c0d01285"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "8ca23c5b261a105f11b9000ed6146d716a88dfed7e897a48a555ec9a7da1f270"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "6e555c3568e34341ffe22a99c7a129ce2f7ea35120b7a13d9b6458024e2e82d8"
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
