require 'formula'

class PythonTwisted < Formula
  homepage 'https://twistedmatrix.com/trac/'
  url 'https://pypi.python.org/packages/source/T/Twisted/Twisted-15.2.1.tar.bz2'
  sha1 'c24b07daa5ff505ee499ec760cf4e1213112bd8f'

  depends_on :python
  # depends_on 'renard/cw/python-itsdangerous'
  # depends_on 'renard/cw/python-werkzeug'
  # depends_on 'renard/cw/python-click'
  # depends_on 'renard/cw/python-jinja2'
  
  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
