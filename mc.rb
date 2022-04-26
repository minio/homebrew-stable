class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-04-26T18-00-22Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8af39a3dd1d8fe2788c73444b965953d4c4667f6469eddd4209249dcdea68b6b"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "b55d25f5c37f3545e3d2325e153324a4195053e169698f346cb6e270277f888d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "683e49d216a9b0cc17cf7c8ce54e762cbe4f859cbcf28c0fa0058650e361cda8"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "3ba46236eba9ae3cc9c51134b21d56a30a92d7cd7971decf4bde6b512c85c005"
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
