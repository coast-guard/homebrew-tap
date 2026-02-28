class Coast < Formula
  desc "Containerized Host — isolated dev environments on a single machine"
  homepage "https://github.com/coast-guard/coasts"
  version "0.0.1"
  license "MIT"

  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.1/coast-v0.0.1-darwin-arm64.tar.gz"
      sha256 "19845064f5582e2d7c2bbd60d0570de0549c57242afe972d7db665c42fe29453"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.1/coast-v0.0.1-darwin-amd64.tar.gz"
      sha256 "b639ad3c893854695d61dbfc96aabb0c9b58756a9f6dab41b08bd1537c95fdbc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.1/coast-v0.0.1-linux-arm64.tar.gz"
      sha256 "1740c2d41fb9ed6a126f8b058c6d4ac8253c034a76096affc078539170359093"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.0.1/coast-v0.0.1-linux-amd64.tar.gz"
      sha256 "344cd06a7440445699e7fea182cf6dff651eab6b678766ab8435dd64ac63679c"
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
