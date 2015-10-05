# install with brew install renard/cw/python-dpath

require 'formula'

class PythonDpath < Formula
  homepage 'https://github.com/akesterson/dpath-python'
  url 'https://github.com/akesterson/dpath-python/archive/build,1.3,1.tar.gz'
  sha1 'f77a1731e615d936a85874f94fe8745be78614b4'

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
