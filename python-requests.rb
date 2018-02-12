require 'formula'

class PythonRequests < Formula
  homepage 'http://docs.python-requests.org/'
  url 'https://github.com/kennethreitz/requests/archive/v2.5.1.tar.gz'
  sha256 '1e5ea203d49273be90dcae2b98120481b2ecfc9f2ae512ce545baab96f57b58c'

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
