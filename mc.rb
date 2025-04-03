class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-04-03T17-07-56Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "58fbe7b03629258623464a294e055ee506b2b055a4b795d15765c04c579bde77"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "11e8d0016c6a80b1dfebb90b2062a3c4fee7c22103a35549684a6b78c564b65f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "8d0c3405c9ad93d374cad867e7037cb5cb618af7a13b6f4577d57c2c20ad1360"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a9a9231b34eb0bb0f494d6ff720ef64ac532be530e3669f5a1fa89b6a3480248"
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
