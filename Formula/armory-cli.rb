class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.10.0/armory-darwin-amd64"
      sha256 "9a3f4b181e9e87bd1ab5871a2aad790abf819cd8ec7cb13c757741ee4bac82b5"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.10.0/armory-darwin-arm64"
      sha256 "22fa46922782ab1ee8e73ff97fd6aece6bc346711f56849d253aef7b82ed3f5f"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.10.0/armory-linux-arm64"
      sha256 "99a1a97bd8992869481941f0bdf180bebefcf0fd2ab54b3044fc706f2929dc51"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.10.0/armory-linux-amd64"
      sha256 "d31eaf49d35b85b72957af69148ace75c4944d5d4736a79c34265062628cc956"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
