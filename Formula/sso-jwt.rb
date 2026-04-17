class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.18"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.18/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "1f3bc108e6e8582055a3e190e67ec7c2052f5316caa0af661ab0797704b9a79c"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.18/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "25929a998759bef67fc716b9051c52a1dae646c2c5639a7fae27c929ebedb0ae"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
