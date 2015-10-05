require 'formula'

class PythonJsonpathRw < Formula
  homepage 'https://github.com/kennknowles/python-jsonpath-rw'
  url 'https://github.com/kennknowles/python-jsonpath-rw/archive/1.2.3.tar.gz'
  sha1 'e61f0c125d60d7bd864cad50c2bc5b362ff7a875'
  
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
