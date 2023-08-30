class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-08-29T22-55-06Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "3db2e5103f8958454daf0b7b53091142bbf80461352bdda96f22fca561ff2f98"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "1428ae7ef02e480ae406c432196113bc1e61246800bd00d05f8c540a55b3774a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "609b626b455945d009e2abcc411c32131e2dc273f3b0c648fb5925dc12346d2d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "2d3f66449257d30dc139805b7bcf7a969d69b7c62176d3b792af0a251387fba1"
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
