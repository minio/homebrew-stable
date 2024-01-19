class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-18T07-03-39Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "8d832595f64ee2574ad3af0ed280d951e793083be9552fa272c174765c241d61"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "74c03f7ea660dbd8a9a625a3aae7507f52d9d0c71e0ba6caea0067dfa8be8a08"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "d44f5a38b8eda2fbd40b7e20c0d213041368f4a8f97d6c82e0b941e24926ac49"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "91f4d49fce1527ce59434904316b76927552eed388e351765a43eb38db3483e1"
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
