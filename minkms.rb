class Minkms < Formula
  git_tag = "RELEASE.2024-10-17T11-32-21Z"  # MinKMS specific
  
  desc "A cloud-native distributed KMS designed to build zero-trust infrastructures at scale"
  homepage "https://min.io"
  url "https://dl.min.io/enterprise/minkms/release/"
  version git_tag 
  revision 1

  if OS.mac?
      url "https://dl.min.io/aistor/minkms/release/darwin-arm64/archive/minkms.#{version}"
      sha256 "7830f9c8c8559f7067d2b97963d20c60a62f27fd587159d9cec9b5da9fbe23ff"
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.min.io/aistor/minkms/release/linux-arm64/archive/minkms.#{version}"
      sha256 "1385da43544d568fda2153570362fd785d4cff68054646e6bce4284d5cafa2d3"
    else
      url "https://dl.min.io/aistor/minkms/release/linux-amd64/archive/minkms.#{version}"
      sha256 "c46e3ff5f05472b395ef7d7bedb7077d529eee9575d421181367a14609638601"
    end
  end

  def install
    bin.install Dir.glob("minkms.*").first => "minkms"
  end

  test do
    system bin/"minkms", "identity" 
  end
end
