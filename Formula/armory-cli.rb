class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.13.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.1/armory-darwin-amd64"
      sha256 "62a2eac9a00ffb3bdb6f6dadff790bd0421c20de09c140ba6901c6916c0d07b8"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.1/armory-darwin-arm64"
      sha256 "376cf098c9aab50e85367ff2de963f36bb15b6622651dff131fcf8c761638236"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.1/armory-linux-arm64"
      sha256 "753a8cc18f5ef60ac3e926fff0bd29317c32013c85868285203f5a41c88ed269"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.1/armory-linux-amd64"
      sha256 "f94f494f1576df998f0d9087be02a4468b12ea31478c3e2c4b901a3c4f0c4fd6"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
