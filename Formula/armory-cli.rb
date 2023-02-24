class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.12.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.12.0/armory-darwin-amd64"
      sha256 "6189c9b333fedcb63c641bb7aca734e9736f83bece3b1480df0851903d2bad24"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.12.0/armory-darwin-arm64"
      sha256 "5190c14ee32314d1b8348d9a8e667e855e4fd974b71bc23499b64b0f52fbc39c"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.12.0/armory-linux-arm64"
      sha256 "10e049d648ddc3b82bedd59a0ec674b2b24f50e05364112463cee68c13ff7d7c"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.12.0/armory-linux-amd64"
      sha256 "c26c64b10773e7f5ad84399001be949e48e00ef2a32a27284c53c490a6e9617f"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
