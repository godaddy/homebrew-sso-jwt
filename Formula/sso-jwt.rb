class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.15"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.15/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "0cd257ed566058ee95cfbbcd3258838a9f8011d98dc0ec10ee7ae4fe51c651d4"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.15/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "7eea10caeb81395885cc01bdf1eb4461eac38c5c87861d234aa6dd1a5abebe14"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
