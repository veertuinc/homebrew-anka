cask "anka-build-cloud-registry" do
  arch intel: "Amd64"

  version "1.38.0-3989ee24"
  sha256 intel: "0226f765bfffd43aa99310813aa47ef90c4582f6e9952f6950bc733f00e54376"

  pkg "AnkaRegistry#{arch}-#{version}.pkg"

  url "https://downloads.veertu.com/anka/AnkaRegistry#{arch}--#{version}.pkg"
  name "Anka Build Cloud Registry"
  desc "Store Anka's virtual machines in a central location"
  homepage "https://veertu.com/"

  livecheck do
    url "https://veertu.com/downloads/anka-build-cloud-registry-darwin-#{arch.downcase}-latest"
    regex(/AnkaRegistry#{arch}[._-]?v?(\d+(?:\.\d+)*[._-]\h+)\.pkg/i)
    strategy :header_match
  end

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
