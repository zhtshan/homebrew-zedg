cask "zedg" do
  version "1.24.3.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.3.1/zedg-zh-cn-macos-aarch64-v1.24.3.dmg"
    sha256 "5a03101f3669179bb9bfe9ac6775129b4481d541b9053bdd8671bcb6675a9f4a"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.3.1/zedg-zh-cn-macos-x86_64-v1.24.3.dmg"
    sha256 "5d4567c7ec384ad57ff4658007bff14ef4e486c3a3902392bafb1c4108467ccc"
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
    "~/Library/Caches/dev.zed.Zed",
    "~/Library/Preferences/dev.zed.Zed.plist",
  ]
end
