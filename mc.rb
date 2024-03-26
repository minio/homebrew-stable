class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-03-25T16-41-14Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "983d0282d515e905d23ec049fffee5d8214fc79ea62d16480de22cd070f3cb4e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "0af9bf1d1c0d3b049bbd31dca3909181e008aa5c70ed0e7c7386fe0ca6661d95"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "065a8fe157792c08e2759d7c4672a945a97ca701431cd61b0029bed80148286c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e8e7732b119eadf6515af8ac814e944587352b5aeaa6e64c21f126ef763129e3"
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
