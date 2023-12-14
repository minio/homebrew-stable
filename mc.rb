class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-14T00-37-41Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "801f457b9f2c877e3a7a96d639e50ad0d7a631f8298365fa7524d59e6b988ca5"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "68b59261f9dd03aaa4122361d5e2642dc936b71408be8fc30e3b1f9cca99e9b1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d40b228d48f2059fa18aeac34ebf2777e2d06b1720e3038ee72e0dcce195e142"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "d779221d6338c2425d8c62646736fd27b1904564edd4b519659579ae7c9b67f4"
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
