class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.2.1/mux-darwin-arm64"
      sha256 "211e5fa7fa22e115ff464784f4f5c15cf1f680dcf1c1a7ff5ae91f077368ab6b"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.2.1/mux-darwin-x64"
      sha256 "7807e632a4ac01d214ceda4f05f3ab5ed91a96111ece01f0973c369338039277"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.2.1/mux-linux-arm64"
      sha256 "c2d3c7e88e5c9250f5ae3e6a1f67f537c194612a243c25df7245da074713508a"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.2.1/mux-linux-x64"
      sha256 "1ecd1ffc39428c064976323a1a14c570905530b146e4915470936dce3f2432d2"
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
