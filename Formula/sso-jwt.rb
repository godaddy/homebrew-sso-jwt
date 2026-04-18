class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.20"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.20/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "10d7ca04459dcaef24d929ad16cd15eaa9c7be9fe051ae5f0e29027f382a75a2"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.20/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "d4af468208f65006099a4a0b47a6d029db7dcd869a67342b0ee8ad12caf960eb"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
