require 'formula'

class PythonWerkzeug < Formula
  homepage 'http://werkzeug.pocoo.org/'
  url 'https://github.com/mitsuhiko/werkzeug/archive/0.9.6.tar.gz'
  sha1 '2fceb3b2143111cbc4c1360906eb379e1dd78873'

  depends_on :python

  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
