class PackmindCli < Formula
  desc "Packmind CLI"
  homepage "https://github.com/PackmindHub/packmind"
  version "0.36.1"

  BASE_URL = "https://github.com/PackmindHub/packmind/releases/download/release-cli/#{version}"

  on_macos do
    on_arm do
      url "#{BASE_URL}/packmind-cli-macos-arm64-#{version}"
      sha256 "c0f0db7d2b8ac6adb45144532680f67d966a876b1145472d64faa9f1c962bb35"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE_URL}/packmind-cli-linux-arm64-#{version}"
      sha256 "b9a4ad4168c492d386df2190c9634bb1d470d275e3f66968698090d49f2f1af6"
    end

    on_intel do
      url "#{BASE_URL}/packmind-cli-linux-x64-#{version}"
      sha256 "5871be74e7fc35f4c1231883d5bbe78f5c93a798c6f38d155b2e6997aa654d92"
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
