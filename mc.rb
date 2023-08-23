class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-08-18T21-57-55Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "6971ef85b35eab78dfce3589fc058d213c7731f0cfac305f40702bbc0de97e49"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "2dc4381ab0973c5280d98b85a54c0f9a2f84653dfa4b5e17dfd2e1b647aa3b73"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "3a66052314a4aa58cd36dde0bdf7a0736bfd24459d7da2e6418dc2912bc83965"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "03b21adb4aed286ab22d234407ac3f57e6907486d743352d90466ebc52213f7e"
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
