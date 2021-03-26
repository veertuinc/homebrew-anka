cask "anka-scripts" do
  version :latest
  sha256 :no_check

  url "https://github.com/veertuinc/getting-started/archive/master.zip"
  name "Anka Getting Started Resources"
  desc "Various scripts for setting up and testing Anka software on your local Apple machine"
  homepage "https://github.com/veertuinc/getting-started"

  depends_on cask: "anka-virtualization"
  depends_on formula: "jq"

  # binary "getting-started-master/create-vm-template.bash", target: "create-vm-template"
  # binary "getting-started-master/create-vm-template-tags.bash", target: "create-vm-template-tags"
  # binary "getting-started-master/install-anka-virtualization-on-mac.bash",
          # target: "install-anka-virtualization-on-mac"

  scripts = Pathname.glob "#{staged_path}/**/*.bash"

  postflight do
    scripts.each do |script|
      # FileUtils.chmod "+x", script
      File.symlink script, "#{HOMEBREW_PREFIX}/bin/#{script.basename} #{script.extname}"
    end
  end

  uninstall_preflight do
    scripts.each do |script|
      FileUtils.safe_unlink "#{HOMEBREW_PREFIX}/bin/#{script.basename} #{script.extname}"
    end
  end
end
