require 'formula'

class PythonItsdangerous < Formula
  homepage 'https://pythonhosted.org/itsdangerous/'
  url 'https://github.com/mitsuhiko/itsdangerous/archive/0.24.tar.gz'
  sha1 'c163104c0d80830c6f8c28dee4fe1e576602780f'

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
