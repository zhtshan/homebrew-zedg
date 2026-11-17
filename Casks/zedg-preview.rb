cask "zedg-preview" do
  version "1.29.1-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.1-pre/zedg-zh-cn-macos-aarch64-v1.29.1-pre.dmg"
    sha256 "d3abf425a3fd4ead15ab56b79d9fc7bcd7a642c80343854133f3a5e513cf4776"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.1-pre/zedg-zh-cn-macos-x86_64-v1.29.1-pre.dmg"
    sha256 "44b1e1c0df9db7b6e2e060b41662fbd4183c03fbcc14d8c5a3dea164e58f422e"
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
