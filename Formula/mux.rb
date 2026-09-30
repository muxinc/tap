class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v3.0.0/mux-darwin-arm64"
      sha256 "a5a7dd998fd5090b9d4c90d94d5c3acadc8cf1cb0f2071ee007a951fe50b0066"
    else
      url "https://github.com/muxinc/cli/releases/download/v3.0.0/mux-darwin-x64"
      sha256 "948ceb0b9b58991bf8c68198efa5c1d552029b2e1403c6c55f9b5334a62c42e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v3.0.0/mux-linux-arm64"
      sha256 "a0750b7098c58a350ddcb9d257801a031e58753906d44d91cacc6b4dd0d202c6"
    else
      url "https://github.com/muxinc/cli/releases/download/v3.0.0/mux-linux-x64"
      sha256 "e8d26d58f6258b56e301c712d773633e25d3ecd10199359b3a9073afcd05e490"
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
