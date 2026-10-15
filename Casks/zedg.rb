cask "zedg" do
  version "1.24.2"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.2/zedg-zh-cn-macos-aarch64-v1.24.2.dmg"
    sha256 "5f2b72b35bf6196f81323954d1eb2dca190e2b9086cdc8f5f821dd10fb993dd9"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.2/zedg-zh-cn-macos-x86_64-v1.24.2.dmg"
    sha256 "d6d42caa43db8190d85c1d653169c87296dc14b1083893671da9ccfcd309f2e9"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
