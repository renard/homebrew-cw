require 'formula'

class Diceware < Formula
  homepage 'https://github.com/akheron'
  head 'https://github.com/akheron/diceware.py.git', :branch => :master

  depends_on :python

  def patches
    DATA
  end

  def install

    system "/usr/local/bin/python", "setup.py", "build"
    system "mv", "build/scripts-2.7/diceware.py", "build/scripts-2.7/diceware"
    bin.install Dir['build/scripts-2.7/*']
  end
end

__END__
diff --git a/diceware.py b/diceware.py
index 61de51a..2bb7fef 100755
--- a/diceware.py
+++ b/diceware.py
@@ -56,6 +56,8 @@ WORD_LIST_URLS = {
     "se": "http://x42.com/diceware/diceware-sv.txt",
     "tr": "http://dicewaretr.110mb.com/diceware_tr.txt",
     "nl": "http://theworld.com/~reinhold/DicewareDutch.txt",
+    "fr": "https://raw.githubusercontent.com/chmduquesne/diceware-fr/"
+          "master/diceware-fr-5-jets.txt",
 }

 def generate_grid(word_list, words=5, specials=0):
