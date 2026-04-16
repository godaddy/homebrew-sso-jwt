class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.10"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.10/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "4a3d9d05c39c7378c2eb21bd482601cae71df8ec9c300c7cc837b24329378615"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.10/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "ee5a519a1e5b8323c413a569c567045710aec3f5d85c665552fb66937892f74a"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
