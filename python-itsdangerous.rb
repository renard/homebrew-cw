require 'formula'

class PythonItsdangerous < Formula
  homepage 'https://pythonhosted.org/itsdangerous/'
  url 'https://github.com/mitsuhiko/itsdangerous/archive/0.24.tar.gz'
  sha256 'b035b2da1d493b00a5ee7a5b750f96929de87b610643939fbe382902774626fc'

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
