cask "zedg-preview" do
  version "1.25.0-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.25.0-pre/zedg-zh-cn-macos-aarch64-v1.25.0-pre.dmg"
    sha256 "236d83d8a65931b6a0becc1e85d2cd01f786ea8d92d6c0780dcc5db927fae5d7"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.25.0-pre/zedg-zh-cn-macos-x86_64-v1.25.0-pre.dmg"
    sha256 "b99fa541d4751ba2e34e31c469fbe0b78693d7697b87f917508a36be7b372091"
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
