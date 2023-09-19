class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.16.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.3/armory-darwin-amd64"
      sha256 "d3229c225e92b3b5f624c40126c817e19ae14457beb4001847fd26867ce8ae90"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.3/armory-darwin-arm64"
      sha256 "948cb3ca58652a82862d05392ab19e25a6bdb89e7fdb301ec6f76b753f8d8f83"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.3/armory-linux-arm64"
      sha256 "8a6d271dfe701fe47c81345c5d76df27f3cd127fcebb8ea5da63247b1dbd7f0f"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.3/armory-linux-amd64"
      sha256 "f0202bcaef39f0e9e13ebc0e703ad73ce07c228ad39f1df26af53d5cab50770e"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
