require 'formula'

class PythonCommando < Formula
  homepage 'https://pypi.python.org/pypi/commando'
  url 'https://pypi.python.org/packages/source/c/commando/commando-1.0.0.tar.gz'
  sha256 '3cc802fc8c13d562d9de3ad9246da3f5931cc99c07cc9cc8a70cd0a816f75682'

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
