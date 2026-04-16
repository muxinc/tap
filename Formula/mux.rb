class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.3.0/mux-darwin-arm64"
      sha256 "aa3bc571d93073a49f3b1a1d7d1d001cd0dc97bd863aef76911542991cbc845b"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.3.0/mux-darwin-x64"
      sha256 "6b4a8af50ac9f0b348e0bac69481abc9adec764c25ed6d4678296719245c2e6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.3.0/mux-linux-arm64"
      sha256 "8ff22aeea92658a97a93054d3f43ad5db2a956333d419850653622d16b738573"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.3.0/mux-linux-x64"
      sha256 "d5efdbe981bc454aa1781a394cf5f538c39dd1b73626e5639fef83cfe69c36a0"
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
