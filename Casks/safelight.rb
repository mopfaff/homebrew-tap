cask "safelight" do
  version "1.0,12"
  sha256 "5e710d2c38cd97ee7587f59e5e234c1c4dc03569156b75316d0f0b944d5c47f7"

  url "https://github.com/mopfaff/Safelight/releases/download/v#{version.csv.first}/Safelight-#{version.csv.first}.dmg"
  name "Safelight"
  desc "Schedule color filters, brightness, and Light/Dark appearance and wallpaper"
  homepage "https://github.com/mopfaff/Safelight"

  livecheck do
    url "https://github.com/mopfaff/Safelight/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Safelight.app"

  uninstall quit: "Mo.Safelight"

  zap trash: [
    "~/Library/Application Support/Mo.Safelight",
    "~/Library/Caches/Mo.Safelight",
    "~/Library/HTTPStorages/Mo.Safelight",
    "~/Library/HTTPStorages/Mo.Safelight.binarycookies",
    "~/Library/Preferences/Mo.Safelight.plist",
  ]

  caveats <<~EOS
    Safelight is not notarized. On first launch, macOS will say it cannot check
    the app for malware: click Done, then open System Settings › Privacy & Security
    and click Open Anyway.
  EOS
end
