cask "zedg" do
  version "1.25.3"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.25.3/zedg-zh-cn-macos-aarch64-v1.25.3.dmg"
    sha256 "064422e4921dacbe0a74edc179bb1d1b4fdaea4e2b5636b8ea4db270fd544ea5"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.25.3/zedg-zh-cn-macos-x86_64-v1.25.3.dmg"
    sha256 "c72fb70970d1c5a4e871bf52b67bf33734ed5f419aac7522e2915d4600a1f291"
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
