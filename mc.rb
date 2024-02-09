class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2024-02-09T22-18-24Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "bd1a2a0adf93b394fba4f41ed35bb06fe8172d45c264235aa64ac9874467ca25"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "d4e5421a78802b41adedb5b972efdd148188820387fd6dc5577bf6ce20da2682"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "5855392ec97ef795fd8a9387af410fcb1117c7fc48d5b6c01dff82466534bb84"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "f394c1017dbabf04e365931df24701598782f939efc88c6f771e464f918e274e"
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
