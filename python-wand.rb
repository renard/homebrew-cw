require 'formula'

class PythonWand < Formula
  homepage 'http://wand-py.org/'
  url 'https://github.com/dahlia/wand/archive/0.4.0.tar.gz'
  sha1 'd058a569852214a2d9aaab7a35f3b8a1ea03151e'

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
