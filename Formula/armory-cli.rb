class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.16.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.2/armory-darwin-amd64"
      sha256 "fd35c4337730f2fc34135a0c35073a71506dfefb85e0392eed2e1d6fce6e49a8"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.2/armory-darwin-arm64"
      sha256 "02fcf1cc80438d9348cea7625b960765ec38ccebd08761dff258b100faf7912a"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.2/armory-linux-arm64"
      sha256 "785921545da6f370ab35e7612b5036f5945558c421739f04f107520197e8f159"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.16.2/armory-linux-amd64"
      sha256 "9468e0ed1959ae1efeb03763244243753d5ef88e47a6bad800865669811aa5e2"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
