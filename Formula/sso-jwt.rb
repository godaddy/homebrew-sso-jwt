class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.19"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.19/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "a42e5c21f0455131620b2bfd51a3e0821fb9397d546ccc6b88626db761ed1add"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.19/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "052777769e01e4b5c89bc9a44d8c850928fed371441fabc2900b3836bb998fc1"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
