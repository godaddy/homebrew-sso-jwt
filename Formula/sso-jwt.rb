class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching (Secure Enclave / TPM)"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.2.0/sso-jwt-aarch64-apple-darwin.tar.gz"
      sha256 "41320a1e901e78533dedf85f5b65e0cf69c811d4e76304266b7bb167a7e44030"
    end
    on_intel do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.2.0/sso-jwt-x86_64-apple-darwin.tar.gz"
      sha256 "5b7d018c3a7f93a5beadf584c1e19264dcded91cdc66863139ce8c5e02cd01be"
    end
  end

  def install
    bin.install "sso-jwt"
  end

  def caveats
    <<~EOS
      Add shell integration to your profile:

        echo 'eval "$(sso-jwt shell-init)"' >> ~/.zshrc

      Usage:

        SSO_JWT=$(sso-jwt) terraform apply
    EOS
  end

  test do
    assert_match "sso-jwt #{version}", shell_output("#{bin}/sso-jwt --version").strip
  end
end
