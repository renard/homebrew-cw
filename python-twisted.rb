require 'formula'

class PythonTwisted < Formula
  homepage 'https://twistedmatrix.com/trac/'
  url 'https://pypi.python.org/packages/source/T/Twisted/Twisted-15.2.1.tar.bz2'
  sha1 'c24b07daa5ff505ee499ec760cf4e1213112bd8f'

  depends_on :python
  # depends_on 'renard/cw/python-itsdangerous'
  # depends_on 'renard/cw/python-werkzeug'
  # depends_on 'renard/cw/python-click'
  # depends_on 'renard/cw/python-jinja2'
  
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
