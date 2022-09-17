class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-09-16T09-16-47Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "9aeaf4f309fd1c89753e68498e3d42143ff1a37a05b5cc1c4756a487370536aa"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "51b953388ef6ea8c866c8df00b00ddcc1988b47e4f769e8a075149255b474a5c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b288fde2a8c0a4201778ef484c8585e7260931ce5e0c24860debd1317c29a6bb"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "4caa927e5961d2d1392a4c00e3fea94b25ad8c59baa73452e8e9f4e7703f61a3"
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
