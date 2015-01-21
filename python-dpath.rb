# install with brew install renard/cw/python-dpath

require 'formula'

class PythonDpath < Formula
  homepage 'https://github.com/akesterson/dpath-python'
  url 'https://github.com/akesterson/dpath-python/archive/build,1.3,1.tar.gz'
  sha1 'f77a1731e615d936a85874f94fe8745be78614b4'

  depends_on :python

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
