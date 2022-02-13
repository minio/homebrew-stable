class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-02-13T23-26-13Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "28cc9b78acdd6e42fcef20fac947c09d820b9384bf2f40c81e9860e2af7803da"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "066f2ace848ce64e4596c9db9427dee17785fcdf84a61b9942950bfb0da3084a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "6da00499a1ef036804695ffefb180e0fb71cbe6a37c9bb72d5fac19d3bd9d158"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "aa2e4c1f6d116ad84561604880caafe6b517dd918b525a094c74c0f738440243"
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
