class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-11-21T17-21-54Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1f8903fb93ab50420b7bf9fba026922e14833c346e5c2a2ee9b0eaf1139918d0"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "ad045198448779805efaf044381d5f7ae32a8b6cd90aa23b7af64adff28ffccd"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a6b0b36ccd4674524674a032d10b1a474ffe4187e93d83f53560092c86c57ac4"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "0312010a9d0aa7a52b4dfb14330f289ee4e295def80b3a3f530d4f38c1b71da0"
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
