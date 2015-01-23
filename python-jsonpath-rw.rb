require 'formula'

class PythonJsonpathRw < Formula
  homepage 'https://github.com/kennknowles/python-jsonpath-rw'
  url 'https://github.com/kennknowles/python-jsonpath-rw/archive/1.2.3.tar.gz'
  sha1 'e61f0c125d60d7bd864cad50c2bc5b362ff7a875'
  
  depends_on :python

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
