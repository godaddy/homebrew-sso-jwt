class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching (Secure Enclave / TPM)"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.3.1/sso-jwt-aarch64-apple-darwin.tar.gz"
      sha256 "253cc7b5ab73ce82194c61082afd209601af0b71f8c6d6189ee7e430bfbbf847"
    end
    on_intel do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.3.1/sso-jwt-x86_64-apple-darwin.tar.gz"
      sha256 "362d607fbbdb23d3ff33f31ab45142ffebeb071004772ee56ffa3e360f294cb9"
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
