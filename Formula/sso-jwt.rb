class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.11"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.11/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "2ff53e1da9bffc84a96bbc24a727e22cadf060d458719d27ff702cc0b91e5d18"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.11/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "c38785a5c5d56b445a27cbc906048f33cb83c5d56e021d783e155931b8e3cb6c"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
