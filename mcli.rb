class Mcli < Formula
  # mc specific
  git_tag = "RELEASE.2023-05-04T18-10-16Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "65dbab1b43dde3d66ec80a4add787c754ac37c621c66af5a5d245ae24590c4eb"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "166ffece495faf4c26f842c1442d8175df8a15391126024f163c686a1841db2d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b2beb693e09528c25dbb566abf88bb0b94fd2477730c00a496bfceb0f8e9cd2b"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "cd26ea353811880704efe8eb1b3335461240c1d4f7e4f3efee1b4391697662e4"
    end
  end

  def install
    bin.install Dir.glob("mc.*").first => "mcli"
  end

  test do
    system bin/"mcli", "mb", testpath/"test"
  end
end
