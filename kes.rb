class Kes < Formula
  git_tag = "2023-05-02T22-48-10Z"  # KES specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://github.com/minio/kes"
  version git_tag 
  revision 1

  if OS.mac?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-arm64"
      sha256 "810a5faefd2d0427197e3d7e654291dd3ff25b54d1507988e80f7b6a26d3adfb"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-arm64"
      sha256 "02bb57e9ce3f1bdb0e6344addca70601f368bda238ed7ce5850015192762dda2"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-amd64"
      sha256 "599660e8548d3c5ea7366bbf860f24dffa0165dc5cf47946118ecd1b1ee8247d"
    end
  end

  def install
    bin.install Dir.glob("kes-*").first => "kes"
  end

  test do
    system bin/"kes", "identity", "new"
  end
end
