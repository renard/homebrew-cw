require 'formula'

def which_python
  "python" + `python -c 'import sys;print(sys.version[:3])'`.strip
end

class PythonDocopt < Formula
  homepage 'http://docopt.org'

  git_url = 'https://github.com/docopt/docopt.git'

  url git_url, :using => :git, :tag => '0.6.1'
  head git_url, :using => :git, :branch => 'master'


  depends_on :python

  def install
    # ENV.j1  # if your formula's build system can't parallelize
    
    #python_lib = lib + which_python + 'site-packages'
    #system "python", "setup.py", "build"
    #python_lib.mkpath
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end

  def test
  end
end
