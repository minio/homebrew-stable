class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-04-16T18-13-26Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "0e4e1b37f61d018e699a1bfafe4e45552fe6cfd06188d3b4e2a31bb9da3b2723"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d9c09c49dac63ca051d2638b1b402157a90e30c018b4fddeb55a52f7cd6e198a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "61bb88e7435919834478ddd4d405a6de6d2c227079da5e8ee9655147398819a0"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ac90da87a35641be5a0ac75d49de5161ddb47d629b5ba01261b0ae9e00aea15f"
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
