require 'formula'

class PythonPyopenssl < Formula
  homepage 'https://pypi.python.org/pypi/pyOpenSSL'
  url 'https://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.15.1.tar.gz'
  sha256 'f0a26070d6db0881de8bcc7846934b7c3c930d8f9c79d45883ee48984bc0d672'

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
