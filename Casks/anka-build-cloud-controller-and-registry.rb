cask "anka-build-cloud-controller-and-registry" do
  version "1.11.0-59d63cca"
  sha256 "4ed14fedb8086bd5d1b0d31a2f58d3ec204c9373fd8637d307106cd15f7066b7"

  # d1efqjhnhbvc57.cloudfront.net/ was verified as official when first introduced to the cask
  url "https://d1efqjhnhbvc57.cloudfront.net/AnkaControllerRegistry-#{version}.pkg"
  appcast "https://ankadocs.veertu.com/docs/release-notes/"
  name "Anka Build Cloud Controller & Registry"
  desc "macOS virtual machine management GUI/API and registry"
  homepage "https://veertu.com/"

  depends_on macos: ">= :yosemite"

  pkg "AnkaControllerRegistry-#{version}.pkg"

  uninstall script: {
    executable: "/Library/Application Support/Veertu/Anka/tools/controller/uninstall.sh",
    args:       ["-f"],
    sudo:       true,
  }

  zap trash: "/Library/Logs/Veertu/AnkaController",
      rmdir: "/Library/Application Support/Veertu/Anka/registry"

  caveats do
    license "https://veertu.com/terms-and-conditions/"
  end
end
