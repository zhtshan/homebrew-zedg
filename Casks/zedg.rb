cask "zedg" do
  version "1.29.2"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.2/zedg-zh-cn-macos-aarch64-v1.29.2.dmg"
    sha256 "22360cffbf49084445ff0b7413ab2a842d5949757935d109941e7f8735b23b51"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.2/zedg-zh-cn-macos-x86_64-v1.29.2.dmg"
    sha256 "fb5ac455ab9541fdc94646531bfcfa1c3f96e6410fceddca5c4eca9e9739a927"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
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
