require 'formula'

class PythonRequestsOauthlib < Formula
  homepage 'https://github.com/requests/requests-oauthlib/'
  url 'https://github.com/requests/requests-oauthlib/archive/v0.5.0.tar.gz'
  sha1 '2edb141eab5c6eec3f48bba02f6f36a543696da6'

  depends_on :python
  depends_on 'renard/cw/python-requests'
  depends_on 'renard/cw/python-oauthlib'

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
