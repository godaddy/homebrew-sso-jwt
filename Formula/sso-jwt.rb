class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.8"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.8/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "af50a3cf80c89943d84c8e08707b908d99665a7ab1fe2520c8ff0858f0b80828"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.8/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "830d8c96a1ec77571441eeac02b2778fdf311d004736253dca77525eeb74d3a8"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
