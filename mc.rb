class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-06-06T13-48-56Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "d0ec4923bcf9195a3933c006d8f4279a1574e48ba628f0c72c38e84afd3fdfac"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "7edaa8e65604fd4a40b5151a57a23b44f61428462ec80feb788095cf9ff60b92"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "a223a2c9af9e42a77b4cdc9d58d155f6cd8e046d253a9a14b62b319c3e99a016"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "ee37584710e2d8a109b47e17ddeb6eb849060de3ab1588997f76fc25b8053870"
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
