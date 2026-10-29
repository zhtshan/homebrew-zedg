cask "zedg-preview" do
  version "1.27.0-pre"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.27.0-pre/zedg-zh-cn-macos-aarch64-v1.27.0-pre.dmg"
    sha256 "14afe5c21ba508befa50ed58d3091358e488a9068ad5e52d87bccefbed57c991"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.27.0-pre/zedg-zh-cn-macos-x86_64-v1.27.0-pre.dmg"
    sha256 "8450f8b8d5b972e8523d4dd8fc8755045f511eb258d3f2fcc6e9187a8450d690"
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
