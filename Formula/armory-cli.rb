class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "14.4.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.4/armory-darwin-amd64"
      sha256 "bcc7421e4ad10c2c749a8f4de0517a6ea0fad9ec02b5b219c669f9236f9931af"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.4/armory-darwin-arm64"
      sha256 "7362fe9e7455d865df8db5022088eca7a521f3ebf74a59642feee33317ab8124"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.4/armory-linux-arm64"
      sha256 "25c78e7cf1a7152f7809a512532f7decea9b56ca9418c43c2c754ec11c0e2bab"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v14.4.4/armory-linux-amd64"
      sha256 "e641bc3d72854248b6a9c63d8645c8cfed0b036cd4638c5ba0c71c6d8ce42635"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
