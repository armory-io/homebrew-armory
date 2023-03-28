class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.0/armory-darwin-amd64"
      sha256 "76e99cdaa34b47768be56d529e2fe6fb72229114f784347216a988dcbc3bcb2f"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.0/armory-darwin-arm64"
      sha256 "e29784588f39ee7ac2dad56ae31f249344e21515a3b28d9501e3fdcf16f3b113"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.0/armory-linux-arm64"
      sha256 "88493f937c9362ee3b0070805bb5c5a523988920ae8c62a5a9fd3738a68878cb"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.0/armory-linux-amd64"
      sha256 "320b5829086b75f224dc44c7e61d6d9c03350bd9444789c977e9532941cb6dfc"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
