require 'formula'

class PythonWand < Formula
  homepage 'http://wand-py.org/'
  url 'https://github.com/dahlia/wand/archive/0.4.0.tar.gz'
  sha1 'd058a569852214a2d9aaab7a35f3b8a1ea03151e'

  depends_on :python

  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
