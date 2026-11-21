cask "zedg-preview" do
  version "1.30.2-pre.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.2-pre.1/zedg-zh-cn-macos-aarch64-v1.30.2-pre.dmg"
    sha256 "cca2767e5d63cb08aab6a980138246ccb45dab3ee050a87137b3b140bdd39a50"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.2-pre.1/zedg-zh-cn-macos-x86_64-v1.30.2-pre.dmg"
    sha256 "980e3ae9bc9cdc8a7332a956205155281ec8a2b6043538e55637e8a93ebe79ac"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
  homepage "https://github.com/zhtshan/zed-globalization"

  depends_on macos: :ventura

  app "ZedG.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-rd", "com.apple.quarantine", "{{appdir}}/ZedG.app"]
  end

  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.Zed",
    "~/Library/Preferences/dev.zed.Zed.plist",
  ]
end
