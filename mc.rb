class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-04-22T17-40-00Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "741f8839be58740535d15f1e96532af94e5d2b44f1889dd5b6ab6071b6b24afb"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "88f4e589d86dbf3031f9319fc32fd3113f3853ff91e3a5e2cce8c16d39601a67"
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
