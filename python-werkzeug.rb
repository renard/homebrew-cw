require 'formula'

class PythonWerkzeug < Formula
  homepage 'http://werkzeug.pocoo.org/'
  url 'https://github.com/mitsuhiko/werkzeug/archive/0.9.6.tar.gz'
  sha256 '9199aa5d047474185b80b95191ac730bde0fec54b697b8d8e4b0099949237917'

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
