class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.13.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.2/armory-darwin-amd64"
      sha256 "fac7196f467756d4c7430514953b1be19233a246fe126c291026ff2e66dda3f3"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.2/armory-darwin-arm64"
      sha256 "18e1dfde6786cca9611eec315f2e8afd51c4be520385020e2262db2ab91b8ada"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.2/armory-linux-arm64"
      sha256 "b8b0d27e2c7ba5f3b060582d922c72a04e19baf61afe0398b3dd15322f093cab"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.2/armory-linux-amd64"
      sha256 "264903777ca5c8dc25257145f206cffe7185a5f1bb53272a95c22a2a8d4d7b54"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
