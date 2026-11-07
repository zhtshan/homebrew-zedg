cask "zedg-preview" do
  version "1.28.0-pre.3"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre.3/zedg-zh-cn-macos-aarch64-v1.28.0-pre.dmg"
    sha256 "b934615cd7bb389879784d9c8ee0a545fd3397991a881aacef826de9dd7de8c0"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre.3/zedg-zh-cn-macos-x86_64-v1.28.0-pre.dmg"
    sha256 "1dcddc1ff108deea826bdce4e0d1a11a990f4bca4ec49c699a1b5cdd97192a69"
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
