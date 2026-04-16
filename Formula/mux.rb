class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.3.1/mux-darwin-arm64"
      sha256 "73cf7a73d862ce4a5dc0286a38bc65b13663d827368abb2260c7fc7f2ebd315b"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.3.1/mux-darwin-x64"
      sha256 "f0e317a62f3d422032329e403cd92422e32b2f16576e7986588db8a9c2811668"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.3.1/mux-linux-arm64"
      sha256 "cf8bdce7d35f7ae86dd345444f51755c5b4933de57c6391885b78d86895bb521"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.3.1/mux-linux-x64"
      sha256 "221f91403163948222357719224cbcad245923e13f64087fda31d92ed7951392"
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
