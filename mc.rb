class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-01-16T16-06-34Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "7bac754011fca51a30e3b32700469669e75de4de5d569003107bab9af226af2f"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "5dd5ba4b1461e4d171769a424953509256aad84fa29c1c427c360bd201ad2888"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "7d5bb6e24695e96f111a4c13b45861d65e4fa10a50a340a25690cada9da0218d"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "142090f6e5096d27b932c1a4590e07affc60c9fb6dbeacc7e3f770eeed4ac25e"
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
