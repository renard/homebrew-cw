require 'formula'

class PythonWerkzeug < Formula
  homepage 'http://werkzeug.pocoo.org/'
  url 'https://github.com/mitsuhiko/werkzeug/archive/0.9.6.tar.gz'
  sha1 '2fceb3b2143111cbc4c1360906eb379e1dd78873'

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
