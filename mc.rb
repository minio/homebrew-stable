class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-09-13T23-08-58Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "efaed2a3398e21fb0e260c75a8e63ff489edb3d60d4bb3bfa9cc9ac56eeab1e8"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "3d763381215adbe7bb00114d0921f1b687ae1513c385f60e6ea8aceb8d15345c"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "184f0dcccb8f2e6175194b47cd2d0653e4de7b57c8718e56a967c73b89348707"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "51022d5cb8dd61f67230832a8f17d7d7ce2c980b1cd4d898c63c0505f47f14d1"
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
