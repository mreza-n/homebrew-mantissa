cask "mantissa" do
  version "0.1.0"
  sha256 "54e4f34970f3f97ed6922a31d500592c39aaca68dc9a1f0081fa0d40d11a8e39"

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
