class PackmindCli < Formula
  desc "Packmind CLI"
  homepage "https://github.com/PackmindHub/packmind"
  version "0.26.1"

  BASE_URL = "https://github.com/PackmindHub/packmind/releases/download/release-cli/#{version}"

  on_macos do
    on_arm do
      url "#{BASE_URL}/packmind-cli-macos-arm64-#{version}"
      sha256 "471fe7d0cf34a9016d5d6986ec7e835c007805d9bd423485a8683f39a0195e9b"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE_URL}/packmind-cli-linux-arm64-#{version}"
      sha256 "49a314d3a8118ca23db965420678488d716490bacb1b91aabc7d5b831c485bc7"
    end

    on_intel do
      url "#{BASE_URL}/packmind-cli-linux-x64-#{version}"
      sha256 "a60db9be626669e8a93c23efcecc01698b1d6a1f4d9e8df18705499cffd891d2"
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
