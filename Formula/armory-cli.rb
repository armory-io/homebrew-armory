class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.7/armory-darwin-amd64"
      sha256 "ce9e26f177a24af3610cec094f87d423a510748bb7452f0393455a964ff9887e"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.7/armory-darwin-arm64"
      sha256 "46b78039986aaf041ef741f20ba059b8655a3e6b2e4f0334bc4e8a61bcecd9c8"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.7/armory-linux-arm64"
      sha256 "30e8a716908f37ad2aa5ed70173134258c2abd219ee1cdef348dd7b8c342df16"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.0.7/armory-linux-amd64"
      sha256 "59cae29278300403cebec95b0b6c1a6c3fa7adca06e4e808b03fed7a576bda2f"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
