class Kes < Formula
  git_tag = "2024-01-11T13-09-29Z"  # KES specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://github.com/minio/kes"
  version git_tag 
  revision 1

  if OS.mac?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-arm64"
      sha256 "1b7b17fb324895195c6332e000117cbab68306b609a2129ea9425561e664965a"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-arm64"
      sha256 "6c917c8dfe70707a905dd2630263ba7d2b08144c7cfd4af9076bbea9c8f8dc2d"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-amd64"
      sha256 "4698b6609125b79b452da42744afb68dafdfd1819a8e1c8c7f26e68d7d2cb427"
    end
  end

  def install
    bin.install Dir.glob("kes-*").first => "kes"
  end

  test do
    system bin/"kes", "identity", "new"
  end
end
