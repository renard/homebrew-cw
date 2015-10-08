require 'formula'

class PythonCommando < Formula
  homepage 'https://pypi.python.org/pypi/commando'
  url 'https://pypi.python.org/packages/source/c/commando/commando-1.0.0.tar.gz'
  sha1 '358330ba13daa0e326a02625f10df4a86f6f7919'

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
