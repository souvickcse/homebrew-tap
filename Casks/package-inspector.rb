cask "package-inspector" do
  version "1.0.0"
  sha256 "90e21384fbf3aca8586ed8d2280bf0aa2b4f68c4439a0aa082c38dcd12ee36bc"

  url "https://github.com/souvickcse/npm-Package-Inspector/releases/download/v#{version}/PackageInspector-#{version}.zip"
  name "Package Inspector"
  desc "Native macOS GUI for inspecting installed npm/yarn/pnpm packages"
  homepage "https://github.com/souvickcse/npm-Package-Inspector"

  depends_on macos: :ventura

  app "Package Inspector.app"

  postflight do
    # Not notarized (no paid Apple Developer Program certificate yet), so clear the
    # quarantine flag Homebrew applies on download — otherwise Gatekeeper blocks the
    # app with "can't be opened because it is damaged" on first launch.
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/Package Inspector.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.p360.npmPackageInspector.plist",
    "~/Library/Saved Application State/com.p360.npmPackageInspector.savedState",
  ]
end
