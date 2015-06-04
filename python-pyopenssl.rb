require 'formula'

class PythonPyopenssl < Formula
  homepage 'https://pypi.python.org/pypi/pyOpenSSL'
  url 'https://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.15.1.tar.gz'
  sha1 'e4d752de1fea5a40a982d4d55004cfb14109ba99'

  depends_on :python
  
  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
