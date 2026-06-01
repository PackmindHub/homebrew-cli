class PackmindCli < Formula
  desc "Packmind CLI"
  homepage "https://github.com/PackmindHub/packmind"
  version "0.30.0"

  BASE_URL = "https://github.com/PackmindHub/packmind/releases/download/release-cli/#{version}"

  on_macos do
    on_arm do
      url "#{BASE_URL}/packmind-cli-macos-arm64-#{version}"
      sha256 "f4a25614efd2c3c0cb6123ab2bfe297ee87b39defd781278946bb5b12395f591"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE_URL}/packmind-cli-linux-arm64-#{version}"
      sha256 "6230fee9fc10b73a55bf3012090f131047d8d8ebd633604fa6e4b7e4730fee87"
    end

    on_intel do
      url "#{BASE_URL}/packmind-cli-linux-x64-#{version}"
      sha256 "01c352e418b18d5adc13c7f441c796d1caf7a9f500ae16d525f8690792c4a7ff"
    end
  end

  def install
    binary = Dir["packmind-cli-*"].first
    bin.install binary => "packmind-cli"
    bin.install_symlink "packmind-cli" => "packmind"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/packmind-cli --version 2>&1")
  end
end
