cask "mantissa" do
  version "0.1.0"
  sha256 "1c71c715c11e7cabef7cfd6e91b5e3c6188bd92c633eb4c8814397732a620546"

  url "https://github.com/mreza-n/mantissa-releases/releases/download/v#{version}/Mantissa-#{version}-macos-arm64.zip"
  name "Mantissa"
  desc "Fixed-point DSP debugger and wave-compare tool"
  homepage "https://mantissadsp.com"

  # Apple Silicon only. ``release.yml``'s ``macos-latest`` runner is arm64
  # and that's the single artifact we publish today. ``depends_on arch``
  # makes brew refuse the install on Intel Macs with a clear error rather
  # than serve them a binary they can't run.
  depends_on arch: :arm64

  app "Mantissa.app"

  # Optional CLI shim so users can launch from a terminal with ``mantissa``.
  # Comment this out to keep the cask GUI-only.
  binary "#{appdir}/Mantissa.app/Contents/MacOS/Mantissa", target: "mantissa"

  # Removed by ``brew uninstall --cask --zap mantissa``. Keep in sync with
  # whatever paths the app actually writes (settings, caches, logs).
  zap trash: [
    "~/Library/Application Support/Mantissa",
    "~/Library/Preferences/com.mantissa.*.plist",
    "~/Library/Caches/Mantissa",
    "~/Library/Logs/Mantissa",
  ]
end
