require 'formula'

class PythonHyde < Formula
  homepage 'http://hyde.github.io'
  head 'https://github.com/hyde/hyde.git', :branch => :master

  depends_on :python
  depends_on 'renard/cw/python-oauth2'
  depends_on 'renard/cw/python-commando'
  depends_on 'renard/cw/python-fswrap'
  depends_on 'renard/cw/python-markdown'
  depends_on 'renard/cw/python-markupsafe'
  depends_on 'renard/cw/python-pygments'
  depends_on 'renard/cw/python-pyyaml'
  depends_on 'renard/cw/python-smartypants'
  depends_on 'renard/cw/python-typogrify'


  
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
    bin.install(libexec/"bin/hyde")
  end
end
