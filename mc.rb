class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2025-03-12T17-29-24Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "376e21e6dc41fda629206177dee0f52321ea87e23864efb477918c7745c2a138"
    else
      url "https://dl.min.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "374b38d08ac655eff856df4cad66ad3710c39f93b7835ea52211e640e7ef9ce7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "8baccbba33440c58fcce8c094e527988ca056fa0af3aadf19d83cc129b1a77b8"
    else
      url "https://dl.min.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "a92b5f1af200ca25d54d78432ef6b0c47fd4340abf9759ce5d10275cd57e3318"
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
