require 'formula'

class PythonClick < Formula
  homepage 'http://click.pocoo.org/'
  url 'https://github.com/mitsuhiko/click/archive/6.2.tar.gz'
  sha256 '3aff90410e81bfbf48c47367c8c6d61a336397d7e9f16af96c8a7a6de2b23fff'

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
