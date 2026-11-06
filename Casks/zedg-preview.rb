cask "zedg-preview" do
  version "1.28.0-pre.2"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre.2/zedg-zh-cn-macos-aarch64-v1.28.0-pre.dmg"
    sha256 "625f94b493a51b3701a48adecfa9ca59007f05308c8affa465e5942fbc2a04b0"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre.2/zedg-zh-cn-macos-x86_64-v1.28.0-pre.dmg"
    sha256 "a1565c556ac64bc1845e116b05def47f6bc32fa62badffd1137ba54a2264e74d"
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
