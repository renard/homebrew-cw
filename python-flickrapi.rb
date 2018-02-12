require 'formula'

class PythonFlickrapi < Formula
  homepage 'http://stuvel.eu/flickrapi'
  url 'https://pypi.python.org/packages/source/f/flickrapi/flickrapi-2.1.1.tar.gz'
  sha256 '4a9677f2bf432ab7c72731de2c37d1a6d1ab9733f4430fd35b3addcd48e8f65f'

  depends_on 'python'
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
