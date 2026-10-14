cask "zedg" do
  version "1.23.3"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.23.3/zedg-zh-cn-macos-aarch64-v1.23.3.dmg"
    sha256 "5c361e5ba934bbc57f24443dd084ec07d8dcbaffcabf16f33f50d74e7c39ee79"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.23.3/zedg-zh-cn-macos-x86_64-v1.23.3.dmg"
    sha256 "a77f3d4ab6dd1ba495c2f884909e9322832f844fcfb37d8aef13c70e7656d1b1"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版)"
  homepage "https://github.com/zhtshan/zed-globalization"

  depends_on macos: ">= :ventura"

  app "ZedG.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/ZedG.app"]
  end

  zap trash: [
    "~/Library/Application Support/Zed",
    "~/Library/Caches/dev.zed.ZedG",
    "~/Library/Preferences/dev.zed.ZedG.plist",
  ]
end
