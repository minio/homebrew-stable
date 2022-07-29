class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-07-29T19-17-16Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "285a5d4d2278ff0eeae4b8e0d9d2c59ec73c31f0026e45e83b38f8bf6521870e"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "3b9e793f76d132e5c7bdb54159e16adf069cf7541390f900fd0b4d1fee1cd523"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "291fe706b8d0f745d52a94dc67efd56f32a4ecfbfef28122d6bb822f0a73b685"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "55140582f715d0eb174096207d9983d86369b634166fe8e7f74a9dfae0175943"
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
