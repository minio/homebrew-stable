class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-05-12T03-10-11Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
    sha256 "b3829df3b8a47407d1ee792686f244943893d838271cb4bbe7fdb2ae6704a4ca"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "d1c322cfd029cca13a44e09e6b9eaa9146186bfd325a5e4d2cfd40aed5d42572"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install `mc`"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  test do
    system bin/"mc", "mb", testpath/"test"
  end
end
