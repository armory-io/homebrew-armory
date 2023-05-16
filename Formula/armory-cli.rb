class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.14.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.5/armory-darwin-amd64"
      sha256 "d63b5d45af2e27b494ea6256ea3f2f80e4759646e6c3d4bafd17afe06fddff1e"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.5/armory-darwin-arm64"
      sha256 "917333d6c0c57d571766f20f6de7a9c0b5b8bb78925f7876842bb061a3303410"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.5/armory-linux-arm64"
      sha256 "a9ea885b82021e6b5bdc816345988abb8eae31b4b31e6c088543789566165c01"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/armory-io/armory-cli/releases/download/v1.14.5/armory-linux-amd64"
      sha256 "6ae94553fea0adba74d67ce3ebcb6b969ea4dedbc05cc33a0d08d3cd6072447b"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
