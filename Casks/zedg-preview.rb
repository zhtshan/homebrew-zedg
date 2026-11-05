cask "zedg-preview" do
  version "1.28.0-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre/zedg-zh-cn-macos-aarch64-v1.28.0-pre.dmg"
    sha256 "224fd8ee071635ab9e90341a2b2951a99eb1c7b9b99d5d2f41f0cece6d4647a0"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre/zedg-zh-cn-macos-x86_64-v1.28.0-pre.dmg"
    sha256 "a36c0ce47e2ce53515071501cb3a708c84d2ecb60722b38660d32d88a1da6e30"
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
