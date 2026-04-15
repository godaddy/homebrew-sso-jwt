class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.7"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.7/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "8679ee8f740469168bd102ae31a55854f14d6fbbfe6dac26928ac22b89f61450"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.7/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "c74590fa591d19ed82802aa789b3d332bf5aa9a186c6bc9d6b2b6a7704a22719"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
