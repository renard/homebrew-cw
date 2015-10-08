require 'formula'

class PythonSmartypants < Formula
  homepage 'https://pypi.python.org/pypi/smartypants'
  url 'https://pypi.python.org/packages/source/s/smartypants/smartypants-1.8.6.tar.gz'
  sha1 '5578965b6fd73e2a460cfdcc23819075028ca02b'

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
