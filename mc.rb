class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-10-14T01-57-03Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d42fc0c95504955574d32ce57b201772f0cf8b559ab131a74cd23c446dc09822"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "9e5435cd1e5df752b47629e2ddb67175883a1744e008664d02eb7b92e61331c2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "ddf7aec891a145719ca100d8a7789252bbc3f68978c585c82bfda1ae3adb6123"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "b3e48b80c07ef6126b873e6ab2a681a26407d5ef5ccbb7922f7915ceb8d67281"
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
