cask "zedg-preview" do
  version "1.30.1-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.1-pre/zedg-zh-cn-macos-aarch64-v1.30.1-pre.dmg"
    sha256 "eb90643d7629b670eb1db955507119783f33f5c62df6ef3874da5134a4082106"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.1-pre/zedg-zh-cn-macos-x86_64-v1.30.1-pre.dmg"
    sha256 "88c00a55a9bad7d286b34f46110283ebb08d45587e08fb059db9621c996a61f6"
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
