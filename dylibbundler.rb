require 'formula'

# small command-line programs that aims to make bundling .dylibs as easy as possible.
class Dylibbundler < Formula
  homepage 'https://github.com/auriamg/macdylibbundler/'
  head 'https://github.com/auriamg/macdylibbundler.git', :branch => :master


  def install
    system "make"
    bin.install "dylibbundler"
  end

  def test
    system "dylibbundler", "-h"
  end

  def caveats; <<-EOS
    dylibbundler comes with no man page!

    Pease check documentation at #{homepage}

    Usage example:

      dylibbundler -od -b -x ./HelloWorld.app/Contents/MacOS/helloworld \\
        -d ./HelloWorld.app/Contents/libs/
    EOS
  end
end
