require 'formula'

class PythonTypogrify < Formula
  homepage 'https://pypi.python.org/pypi/typogrify'
  url 'https://pypi.python.org/packages/source/t/typogrify/typogrify-2.0.7.tar.gz'
  sha256 '8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38'

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
