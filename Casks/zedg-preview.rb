cask "zedg-preview" do
  version "1.26.1-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.26.1-pre/zedg-zh-cn-macos-aarch64-v1.26.1-pre.dmg"
    sha256 "fb4347745925ce48c9a9ed36d491d3ea6276aacb959638e3e2b5d025cd194ee6"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.26.1-pre/zedg-zh-cn-macos-x86_64-v1.26.1-pre.dmg"
    sha256 "7bcc25e3b1f768d9b05d2d0f84ec7059745a262f786d1dc2abd5483fac17b2da"
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
