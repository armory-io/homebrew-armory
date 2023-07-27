class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.15.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.4/armory-darwin-amd64"
      sha256 "a6f5c3e44653e3f40bb6135d1d9cae1e68da5a355ed4d06c2bbeb010fcc16c91"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.4/armory-darwin-arm64"
      sha256 "657743c620db29b0515c7637a401642bfdce36abdf43605ec1e86addcc109f43"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.4/armory-linux-arm64"
      sha256 "06cb1e1cd8de81561745d51923e773e2259ef0f0929bd0b104c107fde880a86d"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.4/armory-linux-amd64"
      sha256 "f78049ea569453a88b3bbcf9200798adcb2262c15a0a747f6b76003db1f9f3f0"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
