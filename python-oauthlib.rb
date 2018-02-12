require 'formula'

class PythonOauthlib < Formula
  homepage 'https://pypi.python.org/pypi/oauthlib'
  url 'https://pypi.python.org/packages/source/o/oauthlib/oauthlib-1.0.3.tar.gz'
  sha256 'ef4bfe4663ca3b97a995860c0173b967ebd98033d02f38c9e1b2cbb6c191d9ad'

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
