class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-01-05T05-03-58Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{version}"
    sha256 "560dc4543921c61e54b3f94ec48fb992128934a6617cdbe4cbc5972f456236c4"
  elsif OS.linux?
    url "https://dl.minio.io/client/mc/release/linux-amd64/mc.#{version}"
    sha256 "cd63e436e45feff6e2fa035e4ade9a87d94bd0d1cc9b8616ec0c04d647c3cdb3"
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
