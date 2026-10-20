cask "zedg" do
  version "1.24.3"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.3/zedg-zh-cn-macos-aarch64-v1.24.3.dmg"
    sha256 "16fa767f831632c305fdbb4322ede4aaf8432c7d6f1dd511650aa75c1046b9f1"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.24.3/zedg-zh-cn-macos-x86_64-v1.24.3.dmg"
    sha256 "2f2feb9b7bcf6412bc34ad57921e7415c10dab8f3616b8b4472c7e6c482c4d94"
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
