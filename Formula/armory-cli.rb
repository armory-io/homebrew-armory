class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.17.0/armory-darwin-amd64"
      sha256 "bc915c31aa375e892371b76beea86855591ca5f5ea30becadea3a46f6f014ac2"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.17.0/armory-darwin-arm64"
      sha256 "49ce86a2df651a5c8d05c0f89d7f89508f4ad64297182e182c70aabd2bd83dde"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.17.0/armory-linux-arm64"
      sha256 "036f4d01e7d42d1ffb22e12ed2483acb5ef728c09fc229dc2c2c12c828475127"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.17.0/armory-linux-amd64"
      sha256 "1916db78af8a439127f1a95fcd3cef23aa936ff9429df319c8f0e3f4573b7684"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
