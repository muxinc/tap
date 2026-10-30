class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "4.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v4.0.0/mux-darwin-arm64"
      sha256 "34554baafca6a436e6041cafd6e42417e5fd0486b31137d1a480cd440b9ae765"
    else
      url "https://github.com/muxinc/cli/releases/download/v4.0.0/mux-darwin-x64"
      sha256 "bf1f3cd8ec4fe763a08fba3c6a8fd95b9260cded30a2118c37ff6985871f7556"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v4.0.0/mux-linux-arm64"
      sha256 "3f0d2baed7361b4e2b86de6eb665d7b6c6aab8a268d63e8245986436fbddc7ba"
    else
      url "https://github.com/muxinc/cli/releases/download/v4.0.0/mux-linux-x64"
      sha256 "3c9ba1a8f95a7e220ea12054879b6762076b88aaec6c0ab6a69cde4655de6d21"
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
