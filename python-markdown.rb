require 'formula'

class PythonMarkdown < Formula
  homepage 'https://pypi.python.org/pypi/Markdown'
  version '2.6.2'
  url "https://pypi.python.org/packages/source/M/Markdown/Markdown-#{version}.tar.gz"
  sha256 'ee17d0d7dc091e645dd48302a2e21301cc68f188505c2069d8635f94554170bf'

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
