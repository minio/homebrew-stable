class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2023-12-02T11-24-10Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "ac2e833662d3d07f749af5365c5d5697eacffe7542cc5959b06d880b65eae6a9"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "108a4f107909ccc87801672e258b6f58782e182da927ee2d5901533fb04eb1b7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "91ec8249114a0806f7dde6ceee6057851f8d076e22313c75b136c8c0b4931f42"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "e8627845db4658abacdc0dec38631cf0bd9a296453a4aa07ee7598f17ef0c9fd"
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
