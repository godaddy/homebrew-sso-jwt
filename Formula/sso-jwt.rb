class SsoJwt < Formula
  desc "SSO JWT CLI with hardware-backed secure caching"
  homepage "https://github.com/godaddy/sso-jwt"
  version "0.5.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.21/sso-jwt-aarch64-apple-darwin.tar.gz"
      sha256 "7a843a2dbd0e2adc02b890148298cf6be27a7b8905b3a6d43e5b953836537d83"
    end

    on_intel do
      url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.21/sso-jwt-x86_64-apple-darwin.tar.gz"
      sha256 "bf406aab92aed84130365241c2ca70fd08352828d202cfd43d8600a3cf53fd0f"
    end
  end
  on_linux do
    url "https://github.com/godaddy/sso-jwt/releases/download/v0.5.21/sso-jwt-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "51efd6015b2a48524ae91849e48742b85b45847b7e00e8a4563c4f4c4276a91d"
  end

  def install
    if OS.mac?
      bin.install "sso-jwt"
    else
      bin.install "sso-jwt"
    end
  end

  def post_install
    # Restart a running LaunchAgent-managed daemon so users pick up the
    # new binary immediately after .  kills
    # and relaunches the service; with KeepAlive=true launchd always
    # restarts it. Explicitly targets the gui/<uid> bootstrap domain so
    # this works when brew runs in a background auto-updater context
    # (which lacks the default user session domain that plain
    #  targets). No-op if the LaunchAgent has not been
    # installed yet.
    plist = "#{Dir.home}/Library/LaunchAgents/com.godaddy.#{name}.agent.plist"
    if File.exist?(plist)
      uid = Process.uid.to_s
      system "launchctl", "kickstart", "-k", "gui/#{uid}/com.godaddy.#{name}.agent"
    end
  end

  def uninstall
    # Run the app's own uninstall command before Homebrew removes the
    # binary. This cleans up the SSH config block, shell rc snippet,
    # and LaunchAgent plist so a broken agent job isn't left pointing
    # at a deleted binary after . Idempotent: safe to
    # call even if the app was never configured.
    quiet_system "#{bin}/#{name}", "uninstall"
  end

  def caveats
    <<~EOS
      After installing, run:
        #{name} install

      This configures SSH to use #{name} and starts the agent.

      Before uninstalling with , run:
        #{name} uninstall

      Or simply run  — the formula's uninstall
      hook calls  automatically while the binary is
      still present.
    EOS
  end

  test do
    assert_match "sso-jwt", shell_output("#{bin}/sso-jwt --help 2>&1", 2)
  end
end
