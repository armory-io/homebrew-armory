class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.13.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.3/armory-darwin-amd64"
      sha256 "a49a46fb02e9f654f0c81349b83e154522e477a8ea4119cd62669c99a274aea3"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.3/armory-darwin-arm64"
      sha256 "e9a779abd42aeb71717ad08c140d3881dac5d86aa6aa08660f996075e87a73fe"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.3/armory-linux-arm64"
      sha256 "82c7017eb6bcdebde9a2aa72ea19d3557aabce7797eca60ad5eab6dabab385bc"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.13.3/armory-linux-amd64"
      sha256 "57a589d11e861b59c59a88e8b6a5ffa944ca87d9d91d8ac8b277e7f00f5eec45"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
