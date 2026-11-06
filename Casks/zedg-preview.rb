cask "zedg-preview" do
  version "1.28.0-pre.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre.1/zedg-zh-cn-macos-aarch64-v1.28.0-pre.dmg"
    sha256 "314f7b6614b2a26d7ee6209d7efd9a537a6db846313892892db8678f4c4364fc"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.28.0-pre.1/zedg-zh-cn-macos-x86_64-v1.28.0-pre.dmg"
    sha256 "0ecb6a446c1a20d64a896298571f3ffe80be895afb2593c0f4248158ecbf4851"
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
