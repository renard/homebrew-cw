require 'formula'

def which_python
  "python" + `python -c 'import sys;print(sys.version[:3])'`.strip
end

class Macfsevents < Formula
  homepage 'http://pypi.python.org/pypi/MacFSEvents'
  url 'http://pypi.python.org/packages/source/M/MacFSEvents/MacFSEvents-0.3.tar.gz'
  sha1 'b4fdcd9ce9abf4fe1b3c9fd390ac155367aad5ed'

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
