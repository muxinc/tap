class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.2.0/mux-darwin-arm64"
      sha256 "58757664597c6c623758955df0286d952b50fe21b92f7914b761ec87156e54cd"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.2.0/mux-darwin-x64"
      sha256 "cb651d9b55768c4a9c04bfb756f414c9ba4350c40c41c0d2dbde6e71ad3159ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.2.0/mux-linux-arm64"
      sha256 "59d83b986c551a31ec1451c705a60a02941b941efd63e95764f4d4a8020b0592"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.2.0/mux-linux-x64"
      sha256 "271cde82463fe393f048aa2edfb4931f8bd6af56635de54db0cbc5f030d87eeb"
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
