class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.4"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.4/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "8f2059c7bd690d0c7b121727e8a00b29daafa5a95bf7caa8593a93b95966ce9b"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.4/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "e2605c964e267cf084ca4345116c84e387bceca32b36ce92462626d8a0a65b3f"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
