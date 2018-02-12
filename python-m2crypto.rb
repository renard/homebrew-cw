# install with brew install renard/cw/python-m2crypto
require 'formula'

class PythonM2crypto < Formula
  homepage 'https://pypi.python.org/pypi/M2Crypto'
  url 'https://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-0.22.3.tar.gz'
  sha256 '6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72'

  depends_on 'python'
  # See https://github.com/M2Crypto/M2Crypto/issues/24
  depends_on 'swig304'

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
