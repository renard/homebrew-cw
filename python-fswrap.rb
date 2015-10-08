require 'formula'

class PythonFswrap < Formula
  homepage 'https://pypi.python.org/pypi/fswrap'
  url 'https://pypi.python.org/packages/source/f/fswrap/fswrap-1.0.0.tar.gz'
  sha1 '13aeb655084a1ec64cde1820f8b4b28dde88cad2'

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
