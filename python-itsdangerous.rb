require 'formula'

class PythonItsdangerous < Formula
  homepage 'https://pythonhosted.org/itsdangerous/'
  url 'https://github.com/mitsuhiko/itsdangerous/archive/0.24.tar.gz'
  sha1 'c163104c0d80830c6f8c28dee4fe1e576602780f'

  depends_on :python

  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
