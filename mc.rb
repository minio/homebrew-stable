class Mc < Formula
  # mc specific
  git_tag = "RELEASE.2022-03-31T04-55-30Z"

  desc "MinIO Client for object storage and filesystems"
  homepage "https://min.io"
  url "https://github.com/minio/mc"
  version git_tag
  revision 1

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/darwin-arm64/archive/mc.#{version}"
      sha256 "abcd6c5093f6be7a3c484bfc22e1a56e30fa4845b54c1e280709612496c2a9e9"
    else
      url "https://dl.minio.io/client/mc/release/darwin-amd64/archive/mc.#{version}"
      sha256 "c645a8f1f38c7511e11e4496f27a52ce5e0e99b1ce56e011620f66d31163530e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://dl.minio.io/client/mc/release/linux-arm64/archive/mc.#{version}"
      sha256 "421956177c79dbda6e9d6718de3b70b2f9cfdf14e207c1001ffec54ae65e8365"
    else
      url "https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.#{version}"
      sha256 "105435cfa10d3c9ebea668b6c3b64ca0b38ffa8a977a0879e4a7be23e0703063"
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
