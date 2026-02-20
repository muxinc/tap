class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0/mux-darwin-arm64"
      sha256 "920974c4fa67fe2ba0c20d7018b798b0bfa11a9116413f5e95ec93c4ed17db40"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0/mux-darwin-x64"
      sha256 "1c51581ce7e201c8e77ba04e33216eaf0cc52a350189a4cd7cc7321e947abcc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0/mux-linux-arm64"
      sha256 "fbef8dc0e8e1e41fb2bd58851dcbe652124b046e1783d6cbb56c6c68febf66c9"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0/mux-linux-x64"
      sha256 "345681a6a9118a28dc166dd7428b6a2f47bec4f2b1d4adc3817954067d733e07"
    end
  end

  def install
    binary = Dir.glob("mux-*").first || "mux"
    bin.install binary => "mux"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mux --version")
  end
end
