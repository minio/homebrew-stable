class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-01-29T01-03-27Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "c11a5d296e026b5c15f0dcc2b905b79e54f356d463885a9c9a5692ab9171c6f0"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "47a9984b36b3643dae29c183fb2359e1babb79260462e340c1484710f0ae3c07"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "9757bf2705f6159679cfc548eabd86f837d50a7fab09adb5939b622293781e34"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "6bad19afdd2846986c8893935cde4b3f8ea03591575c930b4790602ee03e196c"
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
