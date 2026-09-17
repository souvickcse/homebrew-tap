cask "pass-generator" do
  version "1.0.2"
  sha256 "1f332b20ca2af22dfb5ef7d61f23ef82dc85f5349ef5755131fbf7c401c838ea"

  url "https://github.com/souvickcse/PassGenerator/releases/download/v#{version}/PassGenerator-#{version}.zip"
  name "Pass Generator"
  desc "Native macOS app for building signed Apple Wallet (.pkpass) files"
  homepage "https://github.com/souvickcse/PassGenerator"

  depends_on macos: :ventura

  app "Pass Generator.app"

  postflight do
    # Not notarized (no paid Apple Developer Program certificate yet), so clear the
    # quarantine flag Homebrew applies on download — otherwise Gatekeeper blocks the
    # app with "can't be opened because it is damaged" on first launch.
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/Pass Generator.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.p360.passgenerator.plist",
    "~/Library/Saved Application State/com.p360.passgenerator.savedState",
  ]
end
