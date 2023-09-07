class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.0/armory-darwin-amd64"
      sha256 "1d547caa7238d25c51fd81a3905af7c80177bf3c5381cee8bbc227a5d54ed5e7"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.0/armory-darwin-arm64"
      sha256 "32d56afdf69974997fd37c898128c11f33d45de1bb400dbfde31f2eee2bd3c78"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.0/armory-linux-arm64"
      sha256 "ab79cc65016300691d6b7e0e4019df8f4ee662d8ce2627bcd11a9a8bb6935845"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.0/armory-linux-amd64"
      sha256 "aa370f53c22b8c5d8d4f047aa7cbc1bc39ed4d1a012b7e91430bd41c6ae9dfcf"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
