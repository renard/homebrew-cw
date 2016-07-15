require 'formula'

class MCli < Formula
  homepage 'https://github.com/rgcr/m-cli'
  head 'https://github.com/rgcr/m-cli.git'
  patch :p1, :DATA
  
  def my_lib
    lib+"m-cli"
  end
  
  def install
    bin.install "m"
    my_lib.install "lib"
    my_lib.install "plugins"
  end

end

__END__
diff --git a/m b/m
index 182b682..039e77c 100755
--- a/m
+++ b/m
@@ -1,8 +1,6 @@
 #!/bin/sh

-pushd `dirname $0` > /dev/null
-MPATH=`pwd -P`
-popd > /dev/null
+MPATH="/usr/local/lib/m-cli"

 . ${MPATH}/lib/colors.sh
 . ${MPATH}/lib/functions.sh
