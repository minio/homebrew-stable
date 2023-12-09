class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-07T22-13-17Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "75547667ffd598fd31068f16936be120a274e5b521c7aa2b9a0a15577b73babb"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "0ce49a556eb09c808df16fe15756adce85d27049fd0b08c531b4be041cae177a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "00c5fe880fd9418f7176b6373068f69d86364302116e62593c9e0dae9153280c"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f596b653ae026df58d5f529b64afe7191cbf571e368402193dcf1ef837470c46"
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
