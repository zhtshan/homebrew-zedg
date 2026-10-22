cask "zedg-preview" do
  version "1.25.2"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.25.2/zedg-zh-cn-macos-aarch64-v1.25.2.dmg"
    sha256 "698fbecb3fe217c053a81b53d705a1d021e77acfeb5f88a7b81f6e6bd79bae56"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.25.2/zedg-zh-cn-macos-x86_64-v1.25.2.dmg"
    sha256 "f9886021d68c22b660d479d198f2a9c3c99d20b280fea0b8069c4914f3849604"
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
