class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.15.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.5/armory-darwin-amd64"
      sha256 "521cadeafbc55b4b440566b28f12857d64d572ee6369fcd01d8c2d5183d4d1ec"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.5/armory-darwin-arm64"
      sha256 "2dcdc79abdad18f58465a1c8002460e4d11157dc2fe15a2556983084a156b8fc"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.5/armory-linux-arm64"
      sha256 "15da1b7d0fddeb2238a0f9150aff37158fbaadcb7d3a572b4319af5a5a27775e"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.5/armory-linux-amd64"
      sha256 "8fcaac24c3249ce1010134ae5d397574b9d4fe6d5cbe371cab83c3d2a3f6dd14"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
