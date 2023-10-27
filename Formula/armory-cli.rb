class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.18.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.18.0/armory-darwin-amd64"
      sha256 "f981d42d9105e4536ff0e9764fd9698132a83c4591febcebbe920f53986c63d8"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.18.0/armory-darwin-arm64"
      sha256 "ff1d6c3426dd1ed313263eab3b1b187a9126b7da4493e3079474ee339240ea14"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.18.0/armory-linux-arm64"
      sha256 "e9805cbc265760c9b139f4dbb5f6c32fc8edf25441eebe646f2c0d446f51b4ef"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.18.0/armory-linux-amd64"
      sha256 "45fc2d0dd831f45e9e68f65c43cef2d122da5d21e44cf670a6de5391e0dcad4c"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
