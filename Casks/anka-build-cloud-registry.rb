cask "anka-build-cloud-registry" do
  version "1.11.0-d43f91c"
  sha256 "5cd249263b1242a50394c1ee2325aa7e3c53d3b4b4f753e2b78e4c98d7861425"

  url "https://d1efqjhnhbvc57.cloudfront.net/AnkaRegistry-#{version}.pkg"
  appcast "https://macupdater.net/cgi-bin/check_urls/check_url_redirect.cgi?url=https://veertu.com/downloads/ankaregistry-mac-latest"
  name "Anka Build Cloud Registry"
  homepage "https://veertu.com/"
  desc "Anka is a suite of software for creating and managing macOS VMs to run on top of Apple hardware and macOS. The Anka Build Cloud includes a Controller (GUI + API) & Registry to integrate with commonly used CI systems like Github Actions, Jenkins, Teamcity, GitLab, and Buildkite. This is the registry only."

  pkg "AnkaRegistry-#{version}.pkg"

  uninstall launchctl: [
    "com.veertu.anka.registry.plist",
  ], delete: [
    "/Library/Application Support/Veertu/Anka/bin/fvutil",
    "/Library/Application Support/Veertu/Anka/bin/ankaregctl",
    "/Library/Application Support/Veertu/Anka/bin/ankaregd",
    "/Library/Application Support/Veertu/Anka/bin/vmnetproxy",
    "/Library/Application Support/Veertu/Anka/bin/vlaunchd"
  ]

  caveats do
    license "https://veertu.com/terms-and-conditions/"
  end
end