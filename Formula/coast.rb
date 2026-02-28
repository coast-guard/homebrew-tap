class Coast < Formula
  desc "Containerized Host — isolated dev environments on a single machine"
  homepage "https://github.com/coast-guard/coasts"
  version "0.1.0"
  license "MIT"

  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0/coast-v0.1.0-darwin-arm64.tar.gz"
      sha256 "fbce1ef05d3c26dbc2f8251a35555c2833fdbcb040c5af83fcc114bbd7de8d3e"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0/coast-v0.1.0-darwin-amd64.tar.gz"
      sha256 "1a49ffee16fc240d429de9b9e032cb91bec8e4c2d1064f05d52d4817af7f0bc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0/coast-v0.1.0-linux-arm64.tar.gz"
      sha256 "948cbe3f2a2b61b75c362eb6503e77447b3274f8e8c3352dbf1ebc0fcee18154"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0/coast-v0.1.0-linux-amd64.tar.gz"
      sha256 "b3fe83636b60cf34e1c1190af986ed783ef9b0b452eb77a3538259d1171749ea"
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
