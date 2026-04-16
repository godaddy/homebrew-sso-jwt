class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.14"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.14/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "88959f131609b137e365ddf4e03e457f6af184a8cdf5477bf41a0674f0943697"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.14/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "17f93fd6edbf54d4c77cf730ab457f1650279094d64f3ca68fbce142fff978a3"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
