class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-07-26T13-08-44Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f9252b4882f5e5e42b886f7bb760abdfb3752743df61fba4886e52901db261fb"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8f9a546e46e449ac521b08fbb5d048b851cebea92bc1bfc1212e1fbdf2df1682"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ff985db4a48bf40eb75c7d2397098ee61caa087aeab021952a9b53ecdd4d82d4"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e3dda4d27a7380c1c8a0a6ede897245e20811bde879daf7cfeef9b914efbf0f0"
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
