class ArmoryCli < Formula
  desc "CLI for Armory CD-as-a-Service"
  homepage "https://docs.armory.io/cd-as-a-service/setup/cli/"
  version "1.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.20.0/armory-darwin-amd64"
      sha256 "fd427b5a3b5ddead99115b0f6817d13b2a5de0a35d55aa2a17d23c6f72cc7ac8"

      def install
        bin.install "armory-darwin-amd64" => "armory"
      end
    end
    if Hardware::CPU.arm?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.20.0/armory-darwin-arm64"
      sha256 "f21495f373061fb898969abc4cc47afb621c3a1ab0e7f7af9bac638afc54cce1"

      def install
        bin.install "armory-darwin-arm64" => "armory"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.20.0/armory-linux-arm64"
      sha256 "c46ca7162e0c52828170b740fbd3fcd2d05f295108eb96b588ffdcde028e39e2"

      def install
        bin.install "armory-linux-arm64" => "armory"
      end
    end
    if Hardware::CPU.intel?
      url "https://armory-cli-releases.s3.amazonaws.com/cli/v1.20.0/armory-linux-amd64"
      sha256 "70daeec03ffedb8f7cccc2f574a2fc3fffcf6afa51c0968cb61f11a57d7b7c32"

      def install
        bin.install "armory-linux-amd64" => "armory"
      end
    end
  end

  test do
    system "#{bin}/armory", "version"
  end
end
