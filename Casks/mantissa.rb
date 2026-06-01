cask "mantissa" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "SHA_FROM_MACOS_ARM64_TXT",
         intel: "SHA_FROM_MACOS_X64_TXT"

  url "https://github.com/mreza-n/mantissa-releases/releases/download/v#{version}/Mantissa-#{version}-macos-#{arch}.zip"
  name "Mantissa"
  desc "Fixed-point DSP debugger and wave-compare tool"
  homepage "https://mantissadsp.com"

  app "Mantissa.app"

  # Brew strips the com.apple.quarantine attribute on cask installs
  # automatically — this is what makes the Gatekeeper warning go away
  # for cask users even on an ad-hoc-signed build. Nothing extra to do here.

  zap trash: [
    "~/Library/Application Support/Mantissa",
    "~/Library/Preferences/com.mantissa.*.plist",
    "~/Library/Caches/Mantissa",
    "~/Library/Logs/Mantissa",
  ]
end