class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.0.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.8/armory-darwin-amd64"
      sha256 "b29708b10d5456668f17b62179e9e6985e69943ca05999231af6d6617d5ca244"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.8/armory-darwin-arm64"
      sha256 "65be3ff2ec2b52cfb4b3f9a47adca16130b6e36efc025f47b8f6c1595a407539"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.8/armory-linux-amd64"
      sha256 "5bc24022b033312e830bd60019223eab871ffcf48d15911d6d38ec10cc85a838"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.8/armory-linux-arm64"
      sha256 "7bb97841defb4bd6c828f512e94967c3915fc7a7783dd3819ee5228c64b480d5"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
