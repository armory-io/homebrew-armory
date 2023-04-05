class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.14.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.1/armory-darwin-amd64"
      sha256 "df2b892f8014eff7da445c4c14f388fbe9967c0a9b2d49af2ea0b14ad4ee96f0"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.1/armory-darwin-arm64"
      sha256 "6f97ae179fbbca034f6f6a00e8f0f4807b8f305c2e701a07f68f776a76ac4eca"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.1/armory-linux-arm64"
      sha256 "7d31199f93a4f719adc4e4410fb8ddca581f107b56cff23f0ea84bce01175a4b"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.1/armory-linux-amd64"
      sha256 "2c98c358c418476362b6fa2717b1e535ae582ae033b7a2f038d3850301f00947"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
