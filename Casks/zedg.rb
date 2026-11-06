cask "zedg" do
  version "1.27.0"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.27.0/zedg-zh-cn-macos-aarch64-v1.27.0.dmg"
    sha256 "0609875b1c44e2d042489ca266b9c4c68b949e6a18e049351e06ace837af82e2"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.27.0/zedg-zh-cn-macos-x86_64-v1.27.0.dmg"
    sha256 "86c6501fce08d75658ed262850faf3f15fe1443f84da6117015ea304e2c42ab1"
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
