class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-02-23T03-15-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "80c0b08f01f333606d34556acf1c8634535396943b3e8b0e0479bf447c7950fa"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "bed4436a5c401d6c7243290b74e5764d1ce985aaf0bbb62b9f890e4ccf99f84a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a37a89ea1eed2565bdf5955ec51b3ff113de86b57c4f7ccf738c713e2694facf"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "3e8fef6fe9bcd3204465a9e0c37cdc354fc8ab3bcc8e78687bb274fd25280551"
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
