class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.16"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.16/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "d83b67deda4dcb7ca49f793b9cc3b7eb6cf7bf3f319f4ca687af33d8b19c6908"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.16/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "1fae8af507830896901b61a9dd32b0dd5d32168e5cbe5d55d8e8ad0ed8fe65cd"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
