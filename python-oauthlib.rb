require 'formula'

class PythonOauthlib < Formula
  homepage 'https://pypi.python.org/pypi/oauthlib'
  url 'https://pypi.python.org/packages/source/o/oauthlib/oauthlib-1.0.3.tar.gz'
  sha1 'c072f1e152900a6a2970f6d589c5cb3b5d12fb93'

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
