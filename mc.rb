class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-02-28T00-12-59Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "f33f64b84529f6988ed757e8d1f9f0aa19d130203ae42249625fa1c98a0bf6dc"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d87c760dc6ed8dedd530a7c04641f976f772139c5da43620b71cbdc676a38a96"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3227c462ef66080eec0bbd8b634589ec8f16f028e856e1fc3dc3ca4be35d4102"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "d07cee8ecb085f3e1d932b054bed6998e89b640821aaae480a7f09f3b56d6d48"
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
