class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching (Secure Enclave / TPM)"
  homepage "https://github.com/gdcorp-im/sso-jwt"
  url "https://github.com/gdcorp-im/sso-jwt.git",
      tag: "v0.1.0",
      revision: "8b79f95446b9b7d69159c7a0a5cf382b3a049957"
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
