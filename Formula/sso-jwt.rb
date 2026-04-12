class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching (Secure Enclave / TPM)"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.1.1/sso-jwt-aarch64-apple-darwin.tar.gz"
      sha256 "166567ea6d1d287d971c4e71ce205a16e357baff642d9f04f8f0422ccf665402"
    end
    on_intel do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.1.1/sso-jwt-x86_64-apple-darwin.tar.gz"
      sha256 "c3fdcd15c97039257e471cda8ac71ce4feac0affd31a2b9b08299a96ae0d4ec0"
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
