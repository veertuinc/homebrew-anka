cask "anka-build-cloud-controller-and-registry" do
  version "1.11.0-59d63cca"
  sha256 "4ed14fedb8086bd5d1b0d31a2f58d3ec204c9373fd8637d307106cd15f7066b7"

  url "https://d1efqjhnhbvc57.cloudfront.net/AnkaControllerRegistry-#{version}.pkg"
  appcast "https://macupdater.net/cgi-bin/check_urls/check_url_redirect.cgi?url=https://veertu.com/downloads/ankacontroller-registry-mac-latest"
  name "Anka Build Cloud Controller & Registry"
  homepage "https://veertu.com/"
  desc "Anka is a suite of software for creating and managing macOS VMs to run on top of Apple hardware and macOS. The Anka Build Cloud includes a Controller (GUI + API) & Registry to integrate with commonly used CI systems like Github Actions, Jenkins, Teamcity, GitLab, and Buildkite."

  pkg "AnkaControllerRegistry-#{version}.pkg"

  # ANKA-1950: remove the need for unload and handle it in the uninstall.sh
  uninstall script: {
      executable: "/Library/Application\ Support/Veertu/Anka/tools/controller/uninstall.sh",
      args:       ["-f"],
      sudo:       true,
  }

  caveats do
    license "https://veertu.com/terms-and-conditions/"
  end
end