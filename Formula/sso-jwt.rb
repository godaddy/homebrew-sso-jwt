class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.5"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.5/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "d52967dce264a4d042f9431577a53b61c338773afa231ade23b2cc7d7bdd9076"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.5/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "fbb5c351482ce60657291b258f46c4fd3320c29b0673424d29c84bde3a57fe0f"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
