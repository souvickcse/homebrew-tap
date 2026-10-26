cask "superbuddy" do
  version "1.1"
  sha256 "c979a4df0835741a37e45d342e4e2a64a81c0bb0e992a2c8eccc7ce013bbd068"

  url "https://github.com/souvickcse/SuperBuddy/releases/download/v#{version}/SuperBuddy-#{version}-universal.dmg"
  name "Super Buddy"
  desc "Animated superhero desktop companions with unique actions and villains"
  homepage "https://github.com/souvickcse/SuperBuddy"

  depends_on macos: :ventura

  app "SuperBuddy.app"

  uninstall quit: "com.souvickghosh.superbuddy"

  zap trash: [
    "~/Library/Preferences/com.souvickghosh.superbuddy.plist",
    "~/Library/Saved Application State/com.souvickghosh.superbuddy.savedState",
  ]

  caveats <<~EOS
    Super Buddy is ad-hoc signed and is not notarized with Apple.
    If macOS blocks the first launch, use System Settings > Privacy & Security > Open Anyway.
    Use the shield icon in the menu bar to choose your buddy and trigger actions.
  EOS
end
