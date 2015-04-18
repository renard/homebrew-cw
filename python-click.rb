require 'formula'

class PythonClick < Formula
  homepage 'http://click.pocoo.org/'
  url 'https://github.com/mitsuhiko/click/archive/3.3.tar.gz'
  sha1 'c6988244cef66666874f291b4439d4ad0ae254ef'

  depends_on :python

  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
