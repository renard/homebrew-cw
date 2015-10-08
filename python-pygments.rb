require 'formula'

class PythonPygments < Formula
  homepage 'https://pypi.python.org/pypi/Markdown'
  url 'https://pypi.python.org/packages/source/P/Pygments/Pygments-2.0.2.tar.gz'
  sha1 'fe2c8178a039b6820a7a86b2132a2626df99c7f8'

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
