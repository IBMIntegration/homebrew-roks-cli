class RoksCli < Formula
    desc "Toolkit to work with Cloud Pak for Integration & OpenShift with golang cli"
    homepage "https://github.com/ibmintegration/roks-cli"
    url "https://github.com/ibmintegration/roks-cli/releases/download/v0.3.3/roks-cli_0.3.3_macos_x86_64"
    version "0.3.3"
    sha256 "33ba534fe16ae4084f25326954e296dd2d7fabd110d7b68c1be0a849a365b140"
  
    option "with-rokscli", "Names the binary rokscli instead of roks"
  
    def install
      nm = "roks"
      if build.with? "rokscli"
        nm = "roks-cli"
      end
      system "mv", "roks-cli_0.3.3_macos_x86_64", nm
      bin.install nm
    end
  
    test do
      if build.with? "rokscli"
        system "#{bin}/roks-cli", "version"
      else
        system "#{bin}/roks", "version"
      end
    end
  end
  