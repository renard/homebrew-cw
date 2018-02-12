require 'formula'

class PythonWand < Formula
  homepage 'http://wand-py.org/'
  url 'https://github.com/dahlia/wand/archive/0.4.0.tar.gz'
  sha256 'ec5a50d1ec49e060c6b24a030308d0b710ea71f92136236ed815e9a0efd5b91e'

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
