class Kes < Formula
  git_tag = "2024-03-28T12-56-37Z"  # KES specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://github.com/minio/kes"
  version git_tag 
  revision 1

  if OS.mac?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-arm64"
      sha256 "12929d90eef620083c408b66dd0ab20d3b6cfb3f1e07e70a6ea45428974a2d62"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-arm64"
      sha256 "851eb35c29f9791a5f561b1d41c881db977b2b10ef5e4c7182b9d118a2d44575"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-amd64"
      sha256 "2bde93fde0864865a8a182222216612f8b7e670a0b93c7d2c52f94baeaf62704"
    end
  end

  def install
    bin.install Dir.glob("kes-*").first => "kes"
  end

  test do
    system bin/"kes", "identity", "new"
  end
end
