class MovieboxTui < Formula
  VERSION = "0.1.26"
  MACOS_SHA256 = "9fe463fce2e304b7197719343531d53df20ca16ddfa72fba5764192066261186"
  LINUX_X64_SHA256 = "d7b07d9b1bac59f183aa9589a8ff22ca21a24f52005fe8d0bd7aac8dd3083526"
  LINUX_ARM64_SHA256 = "bdbf491c8b52cec021ff45f657f7ee59a32fb89cb116065e3130b65c47d2212c"

  desc "Stream movies, shows, anime, and live TV from your terminal"
  homepage "https://github.com/mesamirh/MovieBox-Tui"
  version VERSION
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_macOS_Universal.tar.gz"
    sha256 MACOS_SHA256
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_arm64.tar.gz"
      sha256 LINUX_ARM64_SHA256
    else
      url "https://github.com/mesamirh/MovieBox-Tui/releases/download/v#{VERSION}/MovieBox_Linux_x64.tar.gz"
      sha256 LINUX_X64_SHA256
    end
  end

  def install
    bin.install "moviebox-tui"
  end

  test do
    system "#{bin}/moviebox-tui", "--version"
  end
end
