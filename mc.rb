class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-01-05T23-52-51Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "a635e7fe6107adc63e3171789f76b67fe5195f8be825224ea6ed66be7f37d10a"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e87f05e8d1de2005c37bfc72bfbb00f5ab0f0da4cf514a796a75b5b9e5355990"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "4a5ee5414d1b09583e2ea62befd5d9cf0cec6f838fef6b99088951ae2beae083"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "5e67c1ac9e438f6ca7a03a9c8d5a47bccb111363230b17695a48e8fc9cd287e9"
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
