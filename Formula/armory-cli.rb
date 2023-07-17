class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.15.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.2/armory-darwin-amd64"
      sha256 "20e4b7f53968a3210ffd7587f57b32d9787260748a42a4a5d31d4046e6a465a7"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.2/armory-darwin-arm64"
      sha256 "66988cdae3d378f4dd49214f57a8a909945b589405e7bb503dff45ee4be95e34"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.2/armory-linux-arm64"
      sha256 "1fbe01cebe590ea6c4f595e7e3ebf86e048011bae8515e4f10e4484442923d19"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.2/armory-linux-amd64"
      sha256 "bb6c8fb7871085d8f65e8171cef460f2da37eed2e98dfe8b8d9849fda040021b"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
