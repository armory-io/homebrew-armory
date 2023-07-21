class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.15.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.3/armory-darwin-amd64"
      sha256 "91f2b32777e029a4a554efbeb18e9b6f0d567cfd2e5fb38dcd08608bdb37467b"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.3/armory-darwin-arm64"
      sha256 "670a9c63080bd593e18276fbe9982bf011537fe6a46a7061b6fbb69883630545"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.3/armory-linux-arm64"
      sha256 "17ccfbd230461e641da3698cb03f2a3a274c86fbbfd0c629568bf2de3e67bdb5"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.15.3/armory-linux-amd64"
      sha256 "1969005b44ae05f9968aa379076ed0ef83274331448798fb92eb2f087050b279"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
