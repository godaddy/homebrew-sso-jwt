class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.4.2"
  license "MIT"

  on_arm do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.4.2/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "6284ed61920f3ea7c436d7b4fdc85447274ba16e8a07099881fa663008ef5e69"
  end

  on_intel do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.4.2/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "de382ea14a292a195625b2b9b4e7ac66bc6260191841d5b596296a6c37852332"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
