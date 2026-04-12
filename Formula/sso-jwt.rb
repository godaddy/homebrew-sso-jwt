class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.4.1"
  license "MIT"

  on_arm do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.4.1/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "143630a923ef4a74395964131bc7a5e031db7793026133493fee25ff0addd111"
  end

  on_intel do
    url "https://github.com/jgowdy/sso-jwt/releases/download/v0.4.1/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "de4528630efb3d1382edacae45234dcd0f78ba23a8e316f24d2316fcfd90e11e"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
