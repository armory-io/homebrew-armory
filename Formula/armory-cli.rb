class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.19.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.2/armory-darwin-amd64"
      sha256 "d746b41169eb8e803358fe4649ab75e074ff3a44f257b4cad671b57c476d82ce"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.2/armory-darwin-arm64"
      sha256 "034bb798f8c1490ceefaf52c3cb8563323983fe233a1f618b2a7a0d7a27e2805"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.2/armory-linux-arm64"
      sha256 "8e05ee6bcf68fd5f9fce3546f127af2d4729be637cc60f9c56e5ae66834d15d4"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.19.2/armory-linux-amd64"
      sha256 "f50de6358f7057983a6970a27703d7213b650f0e3c1b294f70b3108e84aea761"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
