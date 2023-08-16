class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-08-15T23-03-09Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "e2105edb135e43973805e4ab1c19c3c1380812b93fceae430d3431e15c65d58b"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c1196a34faed51522847ccdcac7590739cd77a187f849c22a1295ebf23809641"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "8f90ddd4e55b6245367711706fff5715936287e43bcf9d1ab86fda8af832ad68"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f2d1950ad161875e6857fd307e0cb5652bda5becfb8801af40b36827fe5123f9"
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
