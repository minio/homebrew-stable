class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-11-07T23-47-39Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f0d082860837636f2ac7f9f78bf588f01fad61e9ef26c8998c7147b0a2abb9e8"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "6c43975c0f77042f7eb6fc73dd97cd0dfc2b355d4a5a2e14c427770a7de09831"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "2e53b27e0efbfceda6a1b5e85862ea4355fae101246e152cc6f3c0a45a371ab2"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "85ad97a2ceea6b54fc856293bffe964f56c362b747b5b9d07cccfaae5c746ffa"
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
