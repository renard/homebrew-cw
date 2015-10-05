require 'formula'

class PythonExscript < Formula
  homepage 'https://github.com/knipknap/exscript'
  git_url = 'https://github.com/knipknap/exscript.git'

  url git_url,  :tag => 'v2.1'
  head git_url, :branch => 'master'

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
