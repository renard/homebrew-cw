require 'formula'

# See http://blog.matt-swain.com/post/74950056210/homebrew-python-problems
class PythonPyyaml < Formula
  homepage 'http://pyyaml.org/wiki/PyYAML'
  url 'http://pyyaml.org/download/pyyaml/PyYAML-3.11.tar.gz'
  sha1 '1a2d5df8b31124573efb9598ec6d54767f3c4cd4'

  # pyvers = "python" + %x(python -c 'import sys;print(sys.version[:3])').chomp
  # pypref = %x(python-config --prefix).chomp
  # incdir = "#{pypref}/include/#{pyvers}"
  # libdir = "#{pypref}/lib/lib#{pyvers}.dylib"

  
  #depends_on :python
  depends_on 'libyaml'

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
