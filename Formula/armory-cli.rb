class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.0/armory-darwin-amd64"
      sha256 "f2c70d2b0550630536478c5570445ad885f3cace3d9b800e68d493735fef1706"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.0/armory-darwin-arm64"
      sha256 "852e2a5bf3f32cdd4380b64c0a1fd09458ad317db2f4d34670fb30677a49545f"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.0/armory-linux-arm64"
      sha256 "85bbcf4920a8046f8b6d3218e66f29a9e0990a4e6ca6876fefe28eab28681312"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.0/armory-linux-amd64"
      sha256 "07ca86bf52cf02e9e600a5e88cddea807da5e0852b765ce98dd1a4a535049634"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
