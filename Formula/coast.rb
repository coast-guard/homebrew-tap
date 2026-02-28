class Coast < Formula
  desc "Containerized Host — isolated dev environments on a single machine"
  homepage "https://github.com/coast-guard/coasts"
  version "0.1.0-rc.2"
  license "MIT"

  depends_on "socat"

  on_macos do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0-rc.2/coast-v0.1.0-rc.2-darwin-arm64.tar.gz"
      sha256 "6a4901af7057fe57aefc713f7ea4fbfe1d94a4710a71bb9fe2785c18d77619cf"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0-rc.2/coast-v0.1.0-rc.2-darwin-amd64.tar.gz"
      sha256 "a38f2bc6e965b0ae550cc4fdd5fd191ed20fd75f11787edbf0555a549f0aa0c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0-rc.2/coast-v0.1.0-rc.2-linux-arm64.tar.gz"
      sha256 "756df4129d7c0b22d9713c8d92728542b805835207f9df47aab00078fbb32a5f"
    end
    on_intel do
      url "https://github.com/coast-guard/coasts/releases/download/v0.1.0-rc.2/coast-v0.1.0-rc.2-linux-amd64.tar.gz"
      sha256 "b49b67dc26e315e61dd73daaf21d01b7c7324ecd9714226bc82334a0767a2ef1"
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
