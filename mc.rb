class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-05-18T03-39-44Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
    sha256 "d7ff1a7c49941fbbf5b8f4fb7da2f7fde1e68b3b061acdf8a2dd5a3934b95e0e"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
    sha256 "e1612024c538c7289cc007b688397c7ed3dcdc37d180e15f90703571c0d59836"
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
