# install with brew install renard/cw/python-m2crypto
require 'formula'

class PythonM2crypto < Formula
  homepage 'https://pypi.python.org/pypi/M2Crypto'
  url 'https://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-0.22.3.tar.gz'
  sha1 'c5e39d928aff7a47e6d82624210a7a31b8220a50'

  depends_on :python
  # See https://github.com/M2Crypto/M2Crypto/issues/24
  depends_on 'swig304'

  def install
    system "python", "setup.py", "install",  "--prefix=#{prefix}"
  end
end
