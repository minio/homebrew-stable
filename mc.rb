class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-07-11T23-30-44Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8469af46ed3c3950962a74351edb3ede8a7313bdcc38d0112df6c8ff34d0248e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "baacfb551f5f8628db62858aa25f647f09536c94fb8cc2fda9bdf6a63948bbe2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "b59e5de89996045e31c3bdf72f25dd9d1978138fc1ba6d4878fdddc193f160ff"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e791d07cebf7d72a9d0c1a9e629b968eb9d11f525000837152ce8f35c95715b0"
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
