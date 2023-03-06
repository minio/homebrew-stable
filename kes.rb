class Kes < Formula
  git_tag = "2023-02-15T14-54-37Z"  # KES specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://github.com/minio/kes"
  version git_tag 
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-arm64"
      sha256 "bac6e6e0d4a11bb9d32c9da944682429a7684fd7c8153fdc0ff90d91c6f30dd7"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-darwin-amd64"
      sha256 "f84ca3f50732bab84e02b5b55c97e83d36575edc0ce7ccfa6c4df566107acbb5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-arm64"
      sha256 "2dabcdb9bc401c9906b527f11381030930734688d496e7b2e56fe6afc24bef63"
    else
      url "https://github.com/minio/kes/releases/download/#{version}/kes-linux-amd64"
      sha256 "13476a4a8d6319d834faf386b1596146605586113ca177bcc6333a6c2288337c"
    end
  end

  def install
    bin.install Dir.glob("kes-*").first => "kes"
  end

  test do
    system bin/"kes", "identity", "new"
  end
end
