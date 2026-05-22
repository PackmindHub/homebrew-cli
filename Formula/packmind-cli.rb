class PackmindCli < Formula
  desc "Packmind CLI"
  homepage "https://github.com/PackmindHub/packmind"
  version "0.29.0"

  BASE_URL = "https://github.com/PackmindHub/packmind/releases/download/release-cli/#{version}"

  on_macos do
    on_arm do
      url "#{BASE_URL}/packmind-cli-macos-arm64-#{version}"
      sha256 "7aa35252ba9398f4210adc1c286d648743af21cfa2c6fd484308da803f1ec70f"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE_URL}/packmind-cli-linux-arm64-#{version}"
      sha256 "7926ddb42649b3f49fa2e53ba993257eeb2a5812ac20682b0f2bb7f1d373dc21"
    end

    on_intel do
      url "#{BASE_URL}/packmind-cli-linux-x64-#{version}"
      sha256 "bc0c32f4bbf5c206ecc3add42de24ae9eb56fa4084b471a837f4d22d08c0b30f"
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
