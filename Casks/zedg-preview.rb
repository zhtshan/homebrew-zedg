cask "zedg-preview" do
  version "1.26.2-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.26.2-pre/zedg-zh-cn-macos-aarch64-v1.26.2-pre.dmg"
    sha256 "aa67e8e398a2aeeff3c808323d0be6516e575d2680a304322d483f7029f1377c"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.26.2-pre/zedg-zh-cn-macos-x86_64-v1.26.2-pre.dmg"
    sha256 "5520d82c969c9dd0b96d9ffda3500b82da4ad192ba38d435f0ab4529e836542d"
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
