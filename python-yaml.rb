# Install with brew install renard/cw/python-yaml

require 'formula'

class PythonYaml < Formula
  homepage 'http://pyyaml.org/wiki/PyYAML'
  url 'http://pyyaml.org/download/pyyaml/PyYAML-3.11.tar.gz'
  sha1 '1a2d5df8b31124573efb9598ec6d54767f3c4cd4'

  depends_on :python
  depends_on 'libyaml'

  def install
      system "python", "setup.py", "--with-libyaml", "install", "--prefix=#{prefix}"
  end
end
