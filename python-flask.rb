require 'formula'

class PythonFlask < Formula
  homepage 'http://flask.pocoo.org/'
  url 'https://github.com/mitsuhiko/flask/archive/0.10.1.tar.gz'
  sha1 '232f15e4f95f299e79b1e7f44304527f60234b2a'

  depends_on :python
  depends_on 'renard/cw/python-itsdangerous'
  depends_on 'renard/cw/python-werkzeug'
  depends_on 'renard/cw/python-click'
  depends_on 'renard/cw/python-jinja2'
  
  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
