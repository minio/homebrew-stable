class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2018-10-31T22-15-44Z"

  desc "ls, cp, mkdir, diff and rsync for filesystems and object storage"
  homepage "https://github.com/minio/mc"
  url "https://github.com/minio/mc.git"
  version git_tag.gsub(%r'[^\d]+', '') + 'Z'
  revision 1

  if OS.mac?
    url "https://dl.minio.io/client/mc/release/darwin-amd64/mc.#{git_tag}"
    sha256 "83c16e071468a639ef7a44470ad45625f4667e7c4ad476376035779785bfc04c"
  elsif OS.linux?
    raise "No Linux support"
  end

  bottle :unneeded
  depends_on :arch => :x86_64

  conflicts_with "midnight-commander", :because => "Both install a `mc` binary"

  def install
    bin.install Dir.glob("mc.*").first => "mc"
  end

  def post_install
    (etc/"mc").mkpath
  end

  test do
    system bin/"mc", "mb", testpath/"test"
    assert File.exist?(testpath/"test")
  end
end
