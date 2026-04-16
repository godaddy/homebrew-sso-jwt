class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.11"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.11/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "ea5e84a03221483b2c8d33cd203f0941c53cb9fc295fe617a98426e276165881"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.11/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "bc14eac23777aa92be88abad1825015870a58ed105dc0cce4c2d90bd3901db96"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
