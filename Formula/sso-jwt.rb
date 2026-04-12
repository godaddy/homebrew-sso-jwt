class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching (Secure Enclave / TPM)"
  homepage "https://github.com/jgowdy/sso-jwt"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.3.0/sso-jwt-aarch64-apple-darwin.tar.gz"
      sha256 "918938590ae6f82c28c7c1b9d20a03d644d13522fc750d5a3dc8b1b8037871e3"
    end
    on_intel do
      url "https://github.com/jgowdy/sso-jwt/releases/download/v0.3.0/sso-jwt-x86_64-apple-darwin.tar.gz"
      sha256 "f39fea3b148939b4c4d09895a4a9a66904755467aad5d44456258896fac6690b"
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
