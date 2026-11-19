cask "zedg-preview" do
  version "1.30.1-pre.1"

  on_arm do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.1-pre.1/zedg-zh-cn-macos-aarch64-v1.30.1-pre.dmg"
    sha256 "0b6b57b75594160bc7eb2cd5a513512fc8442b699a16cf31232857b08f0001ed"
  end
  on_intel do
    url "https://github.com/zhtshan/zed-globalization/releases/download/v1.30.1-pre.1/zedg-zh-cn-macos-x86_64-v1.30.1-pre.dmg"
    sha256 "c8353418e4e523b4b7fd4c6f23dbfddb2b3f50adce038cfaecd43d04eab85ab0"
  end

  name "ZedG"
  desc "Zed Editor (Localized / 汉化版) - Preview"
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
