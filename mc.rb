class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-12-16T23-38-39Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3467fc4473a870d5d90e7f04161e0796f112933abc17bafd989ca296948ab3b5"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "f2498a7ab93f22ee61b7c1841e709bbb8dfa68920ab5c8888b31327f488f93d5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "00791995bf8d102e3159e23b3af2f5e6f4c784fafd88c60161dcf3f0169aa217"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "d14302bbdaa180a073c1627ff9fbf55243221e33d47e32df61a950f635810978"
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
