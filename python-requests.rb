require 'formula'

class PythonRequests < Formula
  homepage 'http://docs.python-requests.org/'
  url 'https://github.com/kennethreitz/requests/archive/v2.5.1.tar.gz'
  sha1 '7c1e0c35a5c8738d8ad43e38aa9c862e453a7492'

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
