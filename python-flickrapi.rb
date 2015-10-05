require 'formula'

class PythonFlickrapi < Formula
  homepage 'http://stuvel.eu/flickrapi'
  url 'https://pypi.python.org/packages/source/f/flickrapi/flickrapi-2.1.1.tar.gz'
  sha1 '634c264ca34e469192a73577e15d9bdc1d1f2cb8'

  depends_on :python
  depends_on 'renard/cw/python-requests-toolbelt'
  depends_on 'renard/cw/python-requests-oauthlib'

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
