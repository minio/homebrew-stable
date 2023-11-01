class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-10-30T18-43-32Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "b662b6de781a8dc53cf881cd7ff4f1fcee9dc65f4857e9f445b8892ef7dfbf9f"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8ac6592ad5fe858fdb7353c5b67dba1e95b645778a18236e720ac0e0c2ad2384"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "df212d89df806e16845d98063af9b4a33a77e8c444a94ac9de328a3bca5119dc"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "9819284e9387c9e3d553541dec9e6f55fbd258a8f9a2073660b048538a886fdb"
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
