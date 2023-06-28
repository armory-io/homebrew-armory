class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.15.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.1/armory-darwin-amd64"
      sha256 "0eff75edf65c717843a4cf144953739cb99772564f98540ca8251a1b85ef9847"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.1/armory-darwin-arm64"
      sha256 "3ff0d557d401876d876e964e108e234c99c957160ecee673db7583b909ad9cda"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.1/armory-linux-arm64"
      sha256 "cf638849458659948a54088a77936002e6e2aaf8dc54fd9ffbdc5784f39eb7ca"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.1/armory-linux-amd64"
      sha256 "a2b589e659d4727e19cc67e8766930951b960f61538d80ae01f8da716133ef6d"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
