cask "zedg-preview" do
  version "1.24.2-pre.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.2-pre.1/zedg-zh-cn-macos-aarch64-v1.24.2-pre.dmg"
    sha256 "72ddbc6e47081cd6077061aca5821a0e8173cc97200b4fe96baaa495904df9a0"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.2-pre.1/zedg-zh-cn-macos-x86_64-v1.24.2-pre.dmg"
    sha256 "784b4bf0b2c3c8959edcca1fde43bdf6af20f9e12f964c0600ffb299399e09d6"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
  homepage "https://github.com/zhtshan/zed-globalization"

  depends_on macos: ">= :ventura"

  app "ZedG.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/ZedG.app"]
  end

  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.Zed",
    "~/Library/Preferences/dev.zed.Zed.plist",
  ]
end
