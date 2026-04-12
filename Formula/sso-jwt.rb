class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.5.0"
  license "MIT"

  on_arm do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.5.0/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "ae817719a6a2724ca305fe04bca28d630b28c76c3cf420e46074840f7033e697"
  end

  on_intel do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.5.0/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "cf65048bb39f03cee5d22f222fd03a9949f71c3cee4a387903a6bdbb3e983000"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
