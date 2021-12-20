class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2021-12-20T23-43-34Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "98851e850700f1dd23cd7e69a4698fe80a3335d5a55d9b31b8a9745c2932f0e1"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "8a180d64bb692d4c54055b7d647cf34e077b7780a10e2e534452f6c8b0ce1387"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "678f938ac3a426ffede1d9c8fecbd082370eba451a5b7d46525d868f9ce75762"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "9636a8d84fb964a5dfa9072b7e3e15bef5dd93798539aca0cec33c1ebee41d1e"
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
