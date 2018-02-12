# install with brew install renard/cw/python-dpath

require 'formula'

class PythonDpath < Formula
  homepage 'https://github.com/akesterson/dpath-python'
  url 'https://github.com/akesterson/dpath-python/archive/build,1.3,1.tar.gz'
  sha256 '1bae3ef485c799905a8899175e07c4c1b5916e3eb09a81d3890e49d03bd3d327'

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
