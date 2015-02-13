# install with brew install renard/cw/python-pycrypto
require 'formula'

class PythonPycrypto < Formula
  homepage 'https://www.dlitz.net/software/pycrypto/'
  url 'https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.1.tar.gz'
  sha1 'aeda3ed41caf1766409d4efc689b9ca30ad6aeb2'

  depends_on :python

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
