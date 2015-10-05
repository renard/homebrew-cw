require 'formula'

class PythonClick < Formula
  homepage 'http://click.pocoo.org/'
  url 'https://github.com/mitsuhiko/click/archive/5.1.tar.gz'
  sha1 'd38bf618e718e6613512bdb77490686477aa0c16'

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
