class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-07-11T16-16-12Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ce39763b5e0834394deaf2d29807a3d794b02267d8ded495bad6cbdd92ad605e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "5bcacfcba09c78c466a226226707d8bef9da42c3944b82538e7614be7c4a1de1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "94a6e2207e68c7a5d093fe7e17819c135940c44e26bd63bea32043c36517e166"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "36c11c9ca739db52c71873e4c2de162e84ad60006c6dbcc729b49aa5d98f99f0"
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
