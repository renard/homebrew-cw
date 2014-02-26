require 'formula'

class Metastore < Formula
  homepage 'https://github.com/chadrik/metastore'
  head 'https://github.com/chadrik/metastore.git'

  def install
    system "make"
    bin.install "metastore"
    man1.install "metastore.1"
  end

end
