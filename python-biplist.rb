# install with brew install renard/cw/python-biplist
require 'formula'

class PythonBiplist < Formula
  homepage 'https://bitbucket.org/wooster/biplist'
  url 'https://bitbucket.org/wooster/biplist/downloads/biplist-0.9.tar.gz'
  sha256 'b35bc5602fb01c8f8bd05ff18c55f4e861c382d1bd6fb12ce55fc81e9706d1af'

  depends_on :python

  def install
    python_ver = '2.7'
    python_site_package = "python#{python_ver}/site-packages"
    package = name
    ENV.prepend_create_path 'PYTHONPATH', libexec/python_site_package
    
    system 'python', *Language::Python.setup_install_args(libexec)
    site_packages = lib/python_site_package
    site_packages.mkpath
    (site_packages/"#{package}.pth").write <<-EOS.undent
        #{libexec}/vendor/lib/#{python_site_package}
        #{libexec}/lib/#{python_site_package}
    EOS
  end
end
