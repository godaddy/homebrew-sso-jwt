class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.4.0"
  license "MIT"

  on_arm do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.4.0/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "d8d1633f2f34448647ed6f3f904527560d52022c011bcd0679e2c2583164db17"
  end

  on_intel do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.4.0/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "ba4121a17b1d3126dc95c36bdc03f873cb187e3308ec1df73ab833b1b794ba8b"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
