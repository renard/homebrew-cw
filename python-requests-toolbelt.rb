require 'formula'

class PythonRequestsToolbelt < Formula
  homepage 'https://pypi.python.org/pypi/requests-toolbelt'
  url 'https://pypi.python.org/packages/source/r/requests-toolbelt/requests-toolbelt-0.4.0.tar.gz'
  sha256 '15b74b90a63841b8430d6301e5062cd92929b1074b0c95bf62166b8239db1a96'

  depends_on 'python'
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
