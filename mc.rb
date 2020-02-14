class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2020-02-14T19-35-50Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "33284821e891a15feac7f01cdaf131adf3be2e1f87ed8104cb6d288fe6167b9e"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "674770bff5e0e0c1e31714b4d4058de28e1b774248250cacb7cb1eeb50c6ac46"
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
