require 'formula'

class PythonJinja2 < Formula
  homepage 'http://jinja.pocoo.org/'
  url 'https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.7.3.tar.gz'
  sha1 '25ab3881f0c1adfcf79053b58de829c5ae65d3ac'

  depends_on :python

  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
