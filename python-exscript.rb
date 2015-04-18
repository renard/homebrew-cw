require 'formula'

class PythonExscript < Formula
  homepage 'https://github.com/knipknap/exscript'
  git_url = 'https://github.com/knipknap/exscript.git'

  url git_url,  :tag => 'v2.1'
  head git_url, :branch => 'master'

  depends_on :python
  
  def install
      system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end
