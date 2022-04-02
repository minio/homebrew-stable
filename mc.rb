class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-04-01T23-44-48Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1f7b804c0cc276eeb95dbbfaa43dfa7e5a8f2158c3e985c45f9b925cca7243dc"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "0e960ed59b5d859935291e6e4356bc304a6aec3ca671c6040cd20ea8f273d18c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9bc1c67337c1cda7a6ce87b1802bde79127a45327992fbd30e90a7333a6f40d2"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "efb2bcef37639d323090c3de2378e1c0a7756f6183be0de59c365d211f67f054"
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
