class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.6"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.6/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "60e2c4cf1e3fd1316ebd017fd2947697f5a48f394b36506cbd570ca3cacb901b"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.6/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "01bc6bda1bbb06480641b059e9089beb036d96874f825df16aad9c3c643fb16a"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
