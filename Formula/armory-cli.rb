class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.11.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.11.0/armory-darwin-amd64"
      sha256 "05ba281fd670ec1956df7c96e4b5de22bc2f41a1e0e984b4f969366e05aaed1f"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.11.0/armory-darwin-arm64"
      sha256 "db5a85c1607a40273d6c12047f50057fe12fab62054ec3d1b1e18c988c7630c3"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.11.0/armory-linux-arm64"
      sha256 "49884e21ba2e8719f3cabcc2ffa54eefec03a914780b8c2b9bf8309bd191c444"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.11.0/armory-linux-amd64"
      sha256 "40afe763bad807d1740cec2a97c87867ee944b2805026659f90b7505ed07c544"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
