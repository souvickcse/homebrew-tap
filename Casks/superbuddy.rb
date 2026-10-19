cask "superbuddy" do
  version "1.0"
  sha256 "f285757f7fff82ee5769145cc88a53bb5a10a19d79d7040835f32c4028bf80cb"

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
