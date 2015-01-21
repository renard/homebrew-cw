require 'formula'

def which_python
  "python" + `python -c 'import sys;print(sys.version[:3])'`.strip
end

class Macfsevents < Formula
  homepage 'http://pypi.python.org/pypi/MacFSEvents'
  url 'http://pypi.python.org/packages/source/M/MacFSEvents/MacFSEvents-0.4.tar.gz'
  sha1 '0722aeea4b06a3d64a96875f2325ce1bdbf2591f'

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
