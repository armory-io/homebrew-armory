class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.19.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.1/armory-darwin-amd64"
      sha256 "a0b318ca08b8ea75b30e65c0cd88948bb3ed8f82861401c810412af9f82ee3f0"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.1/armory-darwin-arm64"
      sha256 "5d2686ec00aea986186c3be2e476a440c75bb4ab47beba7a93c7e368ced502bc"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.1/armory-linux-arm64"
      sha256 "83621a11fa2191b3450df643816f06d92b7f06661abb55871515b2363049149e"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.1/armory-linux-amd64"
      sha256 "5b1d60956c3efd268cd1393f196a9a253560840d5292be517831336eaa6cd463"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
