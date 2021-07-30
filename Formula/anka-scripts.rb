class AnkaScripts < Formula
  desc "Various scripts for supporting customers"
  homepage "https://github.com/veertuinc/scripts"
  url "https://github.com/veertuinc/scripts/archive/main.tar.gz"
  version "c2c6cc19c6406af1bc3b522a14c3884644488954"
  sha256 "93e5a4cea1b398d099d3bb05e1a614a9503e59a9e9c8526bb1ac4d1aa0dc88ea"

  def install
    libexec.install Dir["*"]

    scripts = Pathname.glob "#{libexec}/*.*sh"
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
    stderr = shell_output "#{bin}/registry-vm-template-files-and-folders /dev/null", 2
    assert_match "must provide VM UUID", stderr
  end
end
