cask "zedg-preview" do
  version "1.30.2-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.2-pre/zedg-zh-cn-macos-aarch64-v1.30.2-pre.dmg"
    sha256 "ab58c1946c400848cfd9bca3e662760aec1094baf662b21e6d1510103a492dfe"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.2-pre/zedg-zh-cn-macos-x86_64-v1.30.2-pre.dmg"
    sha256 "8b155b235ab9a698e5c1f5035fa4a998b04c5574e3187989168b12bd85150451"
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
