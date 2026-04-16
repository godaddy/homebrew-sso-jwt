class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.9"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.9/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "00fda6ef9b189e3f594422102ff8eb802215d52eb4123cdd7f7f45d5be50ec48"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.9/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "5902a929f87ad6eccca6e3e777553394bb5b1498ceb8fc7bab0ef0cdd3bc006a"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
