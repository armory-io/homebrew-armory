class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.14.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.3/armory-darwin-amd64"
      sha256 "cfecc52a07783bc3462c3f630910737e6508d1e0517cfcf714e98761f11e16eb"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.3/armory-darwin-arm64"
      sha256 "9d65c41685f9bc674fd50cf905dc4959798205b234148d90b72a3505c9cde89c"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.3/armory-linux-arm64"
      sha256 "472ade6e624ba4ff6a7983891d2907671af1f8a082789b2b55ae3ced04d427ee"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.3/armory-linux-amd64"
      sha256 "f2337878835e06cdc956cd21dde7d6e7477dac3d854e8b6962dd419c45ede67d"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
