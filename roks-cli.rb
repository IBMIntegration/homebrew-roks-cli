class RoksCli < Formula
    desc "Toolkit to work with Cloud Pak for Integration & OpenShift with golang cli"
    homepage "https://github.com/ibmintegration/roks-cli"
    url "https://github.com/ibmintegration/roks-cli/releases/download/v0.3.1/roks-cli_darwin_amd64"
    version "0.3.1"
    sha256 "33ba534fe16ae4084f25326954e296dd2d7fabd110d7b68c1be0a849a365b140"
  
    option "with-goswagger", "Names the binary goswagger instead of swagger"
  
    def install
      nm = "roks"
      if build.with? "goswagger"
        nm = "goswagger"
      end
      system "mv", "roks-cli_darwin_amd64", nm
      bin.install nm
    end
  
    test do
      if build.with? "goswagger"
        system "#{bin}/roks", "version"
      else
        system "#{bin}/roks", "version"
      end
    end
  end
  