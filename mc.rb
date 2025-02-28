class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-02-21T16-00-46Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8d3788eae00150ce64c3a085ec8d5debfeac561c00f303d65dcfecf46152ac1a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "f3710d9248201307f003cda6d16a03e1800608da12b9c2b901a9441e04fc36b3"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b797ef3835d36ccdf2568071a18066eb8af080230a124150c97556159f2ca38d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "655b13e25f5c99c74ab7dcc3de50574ccc4c933901482c7e962c27175161cca5"
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
