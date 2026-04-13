class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.2"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.2/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "a41f077ca3156bf1d40a8e34f3dae5f3eb9f7c5d68469a1806c7df87234bc209"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.2/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "bd22bd2a9ea6ce189a1de8e3a40f9716f38292ef648d8f69e8abbbb7ee89fe13"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
