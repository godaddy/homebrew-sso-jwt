class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.17"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.17/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "de0a1c610bff6b6afc6a03fb3d3245d7a9c18ee46c4cc2b10dfd91b7e2d671cb"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.17/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "b5741d73ef917a5d68911b04b37c792220d2df12495a0ad43cbd8a2a2eb05ea2"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
