class PackmindCli < Formula
  desc "Packmind CLI"
  homepage "https://github.com/PackmindHub/packmind"
  version "0.22.0"

  BASE_URL = "https://github.com/PackmindHub/packmind/releases/download/release-cli/#{version}"

  on_macos do
    on_arm do
      url "#{BASE_URL}/packmind-cli-macos-arm64-#{version}"
      sha256 "9f5fe4ecb3caf523a38caa7fa97c4c5be267986fe629f2303f069868b2057757"
    end
  end

  on_linux do
    on_arm do
      url "#{BASE_URL}/packmind-cli-linux-arm64-#{version}"
      sha256 "f9179f05d577a4be4b41612a5e73fd85828a87b5fe4c48e59efc0d5e75d33079"
    end

    on_intel do
      url "#{BASE_URL}/packmind-cli-linux-x64-#{version}"
      sha256 "afa7d1ad93ce82aebe8f5f2a683cf493816bff2b755a33c598b21429d3fc60f7"
    end
  end

  def install
    binary = Dir["packmind-cli-*"].first
    bin.install binary => "packmind-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/packmind-cli --version 2>&1")
  end
end
