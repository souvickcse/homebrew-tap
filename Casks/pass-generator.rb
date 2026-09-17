cask "pass-generator" do
  version "1.0.1"
  sha256 "4e1fac7a90107cf67ef989231eb9e23ccd22adb121f3fb2ebdd8c57140e30dca"

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
