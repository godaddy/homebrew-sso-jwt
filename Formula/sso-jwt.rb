class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.3"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.3/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "a5bfdf30acc507d8421366ccd56bd9179220d3db5679d533b55ff0ea1b3e3e57"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.3/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "2184b96a46b26b477307809fd65efa5e4e6fd592675856cfdf583a07d5f6c580"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
