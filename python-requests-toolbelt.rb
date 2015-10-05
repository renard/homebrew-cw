require 'formula'

class PythonRequestsToolbelt < Formula
  homepage 'https://pypi.python.org/pypi/requests-toolbelt'
  url 'https://pypi.python.org/packages/source/r/requests-toolbelt/requests-toolbelt-0.4.0.tar.gz'
  sha1 '89034149cb90c4ba825bbc8c68a590c3ad41f067'

  depends_on :python
  depends_on 'renard/cw/python-requests'

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
