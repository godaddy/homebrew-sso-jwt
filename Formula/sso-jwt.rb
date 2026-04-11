class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching (Secure Enclave / TPM)"
  homepage "https://github.com/gdcorp-im/sso-jwt"
  url "https://github.com/gdcorp-im/sso-jwt/releases/download/v0.1.0/sso-jwt-0.1.0.tar.gz",
      using: CurlDownloadStrategy
  sha256 "fbde5482a7efeee1aca7c855cc1d5871a5fb57ab181cc828a4e538ac0a7e9ac9"
  license "MIT"
  head "https://github.com/gdcorp-im/sso-jwt.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--manifest-path", "sso-jwt/Cargo.toml"
    bin.install "target/release/sso-jwt"
  end

  test do
    assert_match "sso-jwt #{version}", shell_output("#{bin}/sso-jwt --version").strip
  end
end
