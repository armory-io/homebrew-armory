class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "14.4.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.5/armory-darwin-amd64"
      sha256 "b20773f9c350808129a248681bdb4325e69d7475223c5b8d7c1f365cd031d40f"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.5/armory-darwin-arm64"
      sha256 "f0913507c3ead9b0c10b31c31dba1958515b3fbcec51055da5cfd173010c5fe8"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.5/armory-linux-arm64"
      sha256 "97bd5592bb28a1db2557c477f2e73ece0c96065eab37faa5e186ba866ee5002f"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.5/armory-linux-amd64"
      sha256 "974d4cda09c18d483ed680f179fefc3eaf0ef15ceadcedfa5f4a600fb34dd0a7"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
