class Mux < Formula
  desc "The official Mux CLI"
  homepage "https://github.com/muxinc/cli"
  version "1.0.0-beta.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.9/mux-darwin-arm64"
      sha256 "c3c1cf7e20c893bca43a9a56246e0995f170989f1dffdfd09deeb14793fcefd1"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.9/mux-darwin-x64"
      sha256 "2f0699b5326d8cf79ba311642c73291ec3dbacef228c3083547fbd59397c31b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.9/mux-linux-arm64"
      sha256 "3b4a67245383632f900aeb5a3d4a82531011a6cfcb68eccd2ca1c5b55f78d757"
    else
      url "https://github.com/muxinc/cli/releases/download/v1.0.0-beta.9/mux-linux-x64"
      sha256 "a5d21ab6e50a2f9d0806fb851850398292c2c2915de720a74b110aff01bbba4c"
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
