cask "zedg" do
  version "1.29.3"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.3/zedg-zh-cn-macos-aarch64-v1.29.3.dmg"
    sha256 "0efe0a29eb1c17e8fbb449b4dfa58d643f53248e0d8e3b4ab2f22f768872b822"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.29.3/zedg-zh-cn-macos-x86_64-v1.29.3.dmg"
    sha256 "121bdca8f61763a65c19bec6376eb3c899c0ee63bb80563737f2a57f3bd516ad"
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
