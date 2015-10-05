require 'formula'

class PythonJinja2 < Formula
  homepage 'http://jinja.pocoo.org/'
  url 'https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.7.3.tar.gz'
  sha1 '25ab3881f0c1adfcf79053b58de829c5ae65d3ac'

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
