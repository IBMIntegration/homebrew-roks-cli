class RoksCli < Formula
    desc "Toolkit to work with Cloud Pak for Integration & OpenShift with golang cli"
    homepage "https://github.com/ibmintegration/roks-cli"
    url "https://github.com/ibmintegration/roks-cli/releases/download/v0.3.3/roks-cli_0.3.3_macos_x86_64"
    version "0.3.3"
    sha256 "2e165c8af7448447c2d431b5eeb28eed28506e3d7483703ac42daca0be95e330"
  
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
  