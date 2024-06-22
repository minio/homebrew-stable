class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-06-20T14-50-54Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ebc3ca3ae3aafce857396137a5ef3824f0951dd0199a086d8f34d33fe961777e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "b0606fedeeede62bb91b9afd58724de9c9dde022a2a332e70e013f785fe87d8c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "cda1302aa734c43089d76b97c8d56890dcd994512dd78bdd2bd4477968ec111c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "d9f921b43530375ba5dd54d607e69610f7808f9519c53f32a0a89982b18048e5"
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
