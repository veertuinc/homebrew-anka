class AnkaScripts < Formula
  desc "Various scripts for setting up and testing Anka software on your local machine"
  homepage "https://github.com/veertuinc/getting-started"
  url "https://github.com/veertuinc/getting-started/archive/master.zip"
  version "6ae6e30127cd5e22a63066f0e2bc9efcfca23936"
  sha256 "1b476800e9c5704a2fd9a9db3cbc194f21a5f755d145b82ed36c19d713dd488f"

  depends_on "jq"

  def install
    libexec.install Dir[".misc", "*"]
    scripts = Pathname.glob "#{libexec}/**/*-*.bash"
    scripts.each do |script|
      wrap = bin + script.basename(script.extname)
      wrap.write <<~EOS
        #!/bin/bash
        cd #{libexec}
        exec ./#{script.relative_path_from libexec} "$@"
      EOS
    end
  end

  test do
    stderr = shell_output "#{bin}/install-anka-virtualization-on-mac /dev/null", 1
    assert_match "Installing /dev/null", stderr
  end
end
