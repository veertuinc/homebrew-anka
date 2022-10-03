cask "anka-build-cloud-registry" do
  version "1.29.0-8daa18e1"
  sha256 "409211fcecac806115a5b25b20b56bcddfdb874bd81ab28390376308bb9a7015"

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
