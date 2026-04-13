class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.1"
  license "MIT"

  on_arm do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.1/sso-jwt-aarch64-apple-darwin.tar.gz"
    sha256 "5105314f30b5325e9b0858d74b6633c01bb8e9894ea0774935d7598030d67836"
  end

  on_intel do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.1/sso-jwt-x86_64-apple-darwin.tar.gz"
    sha256 "383ded58c6d407341aa3f404c4d005af61d6be709352658efee8dac3437b1211"
  end

  depends_on :macos

  def install
    bin.install "sso-jwt"    end

  test do
    assert_match "sso-jwt", shell_output("\#{bin}/sso-jwt --help 2>&1", 2)
  end
end
