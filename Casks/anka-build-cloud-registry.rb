cask "anka-build-cloud-registry" do
  version "1.26.0-757a6a71"
  sha256 "674c8b87d940485c0f2b8cb83a4d07adbd4e342f2f7bff634d3df1dc0e006fc0"

  url "https://downloads.veertu.com/anka/AnkaRegistry-#{version}.pkg"
  name "Anka Build Cloud Registry"
  desc "Store Anka's virtual machines in a central location"
  homepage "https://veertu.com/"

  livecheck do
    url "https://veertu.com/downloads/ankaregistry-mac-latest"
    strategy :header_match
    regex(/AnkaRegistry[._-]?v?(\d+(?:\.\d+)*[._-]\h+)\.pkg/i)
  end

  pkg "AnkaRegistry-#{version}.pkg"

  uninstall launchctl: [
              "com.veertu.anka.registry.plist",
              "com.veertu.anka.registry",
            ],
            pkgutil:   "com.veertu.anka.registry.pkg",
            delete:    [
              "/Library/Application Support/Veertu/Anka/bin/fvutil",
              "/Library/Application Support/Veertu/Anka/bin/ankaregctl",
              "/Library/Application Support/Veertu/Anka/bin/ankaregd",
              "/Library/Application Support/Veertu/Anka/bin/vmnetproxy",
              "/Library/Application Support/Veertu/Anka/bin/vlaunchd",
            ]

  zap trash: "/Library/Logs/Veertu/AnkaController",
      rmdir: "/Library/Application Support/Veertu/Anka/registry"

  caveats do
    license "https://veertu.com/terms-and-conditions/"
  end
end
