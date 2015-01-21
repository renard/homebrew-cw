# install with brew install renard/cw/python-biplist
require 'formula'

class PythonBiplist < Formula
  homepage 'https://bitbucket.org/wooster/biplist'
  url 'https://bitbucket.org/wooster/biplist/downloads/biplist-0.9.tar.gz'
  sha1 'b2ab598f477470550261550a33d214a29bf2e57b'

  depends_on :python

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
