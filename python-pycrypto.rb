# install with brew install renard/cw/python-pycrypto
require 'formula'

class PythonPycrypto < Formula
  homepage 'https://www.dlitz.net/software/pycrypto/'
  url 'https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.1.tar.gz'
  sha256 'f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c'

  depends_on 'python'

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
