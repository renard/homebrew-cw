require 'formula'

class PythonFlask < Formula
  homepage 'http://flask.pocoo.org/'
  url 'https://github.com/mitsuhiko/flask/archive/0.10.1.tar.gz'
  sha1 '232f15e4f95f299e79b1e7f44304527f60234b2a'

  depends_on :python
  depends_on 'renard/cw/python-itsdangerous'
  depends_on 'renard/cw/python-werkzeug'
  depends_on 'renard/cw/python-click'
  depends_on 'renard/cw/python-jinja2'
  
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
