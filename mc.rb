class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-08-11T00-30-48Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "1f5f28d051295456aa6594f09f7cdcf806df2f8f23fae3e88ee986f2f1704678"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "e24bfeccbc85004abef109972513f3f5d642e71b49a417cf973ca294be31360f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "e2859bc76fbb42edd3775be7c12ad8de42e5030162fe67ceaf7f2292bf5251ae"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "1e1030c88a92e5ba9457c08ef7a98543f57d701457f5f2870e16e915bce174a7"
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
