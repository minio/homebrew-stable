class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-06-15T15-08-26Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b5b417ccf0e208b113c77daa9e419387de859db549eee59f040d9b7e1aadb99a"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "a728affa9e9213cd13d33aad2af8038f9707d172b006fced4508bd405741ff9e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "c54b38f76e85346ca44cc6b6f08df5dee82c5efa58b66a62c6855ed3ed4248d3"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f9d0cd9fe80306b251d40f967435b14b75bd151af055d1efc9bfc20c6dcce65d"
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
