class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.13"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.13/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "6b5e4ad2f41cf2bb8e12d7465f1f2dc7a8f90f1215044be5563e83fc88ee7bd8"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.13/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "4985f7bf901e2738e69ea3678440156fb3af3ccf83edf092d16c5633f75efd70"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
