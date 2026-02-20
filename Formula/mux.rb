class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.0.0-beta.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.8/mux-darwin-arm64"
      sha256 "6452e3f3b0efd4f89a6a82542aa4de6c3f07119c2f1d72c2116f427752582ad0"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.8/mux-darwin-x64"
      sha256 "c43fb8db4c435b7607744fcfdcf7c29c5c3bbcd879d7b6438de80f88d1108327"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.8/mux-linux-arm64"
      sha256 "df696d839123894f25e81e48d3574c5c773a2e02c125068bad39c109120e38a9"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.8/mux-linux-x64"
      sha256 "bcbbe30f340e3310aa179066601f6682768fd84add93fa6bd40d3e3d44b6a033"
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
