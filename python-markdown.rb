require 'formula'

class PythonMarkdown < Formula
  homepage 'https://pypi.python.org/pypi/Markdown'
  url 'https://pypi.python.org/packages/source/M/Markdown/Markdown-2.6.2.tar.gz'
  sha1 'a988f811f1c73de4b49f610dee58a6b8132f5afe'

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
