class Coast < Formula
  desc "Containerized Host — isolated dev environments on a single machine"
  homepage "https://github.com/coast-guard/coasts"
  version "0.0.2"
  license "MIT"

  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.2/coast-v0.0.2-darwin-arm64.tar.gz"
      sha256 "3524c374631cb8c45145ad35de6931c9c9bfe55e5607ec98491f9c9c344dcaf1"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.2/coast-v0.0.2-darwin-amd64.tar.gz"
      sha256 "2bf45a15d18f53e2fd2d732100a2ad97138c35c34f441d7c2f1f53591a52a519"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.2/coast-v0.0.2-linux-arm64.tar.gz"
      sha256 "663a360933874afbf5087ba45e7347446ffdc9008275e9f1c6cffaca063e4737"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.2/coast-v0.0.2-linux-amd64.tar.gz"
      sha256 "32af2653d6eeb816b0a237668671e35cfc50287cc80cb507816b11b3d5136d91"
    end
  end

  def install
    bin.install "coast"
    bin.install "coastd"
  end

  service do
    run [opt_bin/"coastd", "--foreground"]
    keep_alive true
    log_path var/"log/coastd.log"
    error_log_path var/"log/coastd.error.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coast --version")
  end
end
