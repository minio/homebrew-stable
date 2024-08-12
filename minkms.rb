class Minkms < Formula
  git_tag = "RELEASE.2024-08-07T12-30-08Z"  # MinKMS specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://dl.min.io/enterprise/minkms/release/"
  version git_tag 
  revision 1

  if OS.mac?
      url "https://dl.min.io/enterprise/minkms/release/darwin-arm64/archive/minkms.#{version}"
      sha256 "ed8b4855a6ee1614b6f252898a09ca22542ed520c8b042934bc00fdfc4a4b98a"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/enterprise/minkms/release/linux-arm64/archive/minkms.#{version}"
      sha256 "8593342d97e5b74101814a97462c7ae7c72e03c3bf017c0118400a9cae17d95e"
    else
      url "https://dl.min.io/enterprise/minkms/release/linux-amd64/archive/minkms.#{version}"
      sha256 "c10614db9d3dc3131d9879667ac424dd3834ed15320ee7b06bca738fba4613cb"
    end
  end

  def install
    bin.install Dir.glob("minkms.*").first => "minkms"
  end

  test do
    system bin/"minkms", "identity" 
  end
end
