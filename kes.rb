class Kes < Formula
  git_tag = "2023-05-02T22-48-10Z"  # KES specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://github.com/minio/kes"
  version git_tag 
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-arm64"
      sha256 "14537309135118d69b5af24628f68eb1a9e1b83d7272d785103ddadd860a5a02"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-amd64"
      sha256 "8557d1e675eebd0c0d55ad09be6eb613a70237b1c79e4d4f1c50bdf2a7332ea2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-arm64"
      sha256 "e3b96a1f7bc4527ba951e2aa2c04b7248e0c67783976d5604960a0087d02e5f7"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-amd64"
      sha256 "9cc720f5b8348759a3bd04e7c1b23bd2bcc39c529358715a41c80bac52a8dde4"
    end
  end

  def install
    bin.install Dir.glob("kes-*").first => "kes"
  end

  test do
    system bin/"kes", "identity", "new"
  end
end
