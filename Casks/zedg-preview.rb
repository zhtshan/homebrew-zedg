cask "zedg-preview" do
  version "1.28.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.1/zedg-zh-cn-macos-aarch64-v1.28.1.dmg"
    sha256 "5d579a515ba1c6f4813919bedb3dc09ce76c27496abd3ebbe32201957c236f84"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.1/zedg-zh-cn-macos-x86_64-v1.28.1.dmg"
    sha256 "03d5418bb2a1d26ea0ff1c696e48db96da7575c8045e596a1ba98fcf3af8c4a1"
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
