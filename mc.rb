class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-08-17T11-33-50Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "55770d15a889843f9a919f1f3728e4fe95031d6a77cd1c965115feb244bfdd56"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "44780b543cafc978d8a181e4f92ec9047b0ad5e81926f973bf2db65f3fea852a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a50b5bd063bd3e9c3ab30ead1ebfd04960dfc16705af49f462208c995cb8a76c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f480b338a7d7b115d991acabf3c8f204a1645b787caac7c8e84cc400ffec36e0"
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
