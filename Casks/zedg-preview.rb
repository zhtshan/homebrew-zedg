cask "zedg-preview" do
  version "1.29.1-pre.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.1-pre.1/zedg-zh-cn-macos-aarch64-v1.29.1-pre.dmg"
    sha256 "6428e818b01ee06a941abdd91c035776d441afad64f6f4ff6978655513f27099"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.1-pre.1/zedg-zh-cn-macos-x86_64-v1.29.1-pre.dmg"
    sha256 "05190247de3fb95d0f4176db7b1dc30bf915bb04feec0551316e258b5f326a7e"
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
