require 'formula'

class Libfixposix < Formula
  homepage 'https://github.com/sionescu/libfixposix'
  git_url = 'https://github.com/sionescu/libfixposix.git'

  url git_url,  :tag => 'v0.3.0'
  head git_url, :branch => 'master'

  def patches
    DATA
  end


  def install
    system "autoreconf", "-i", "-f"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

end

__END__
diff --git src/lib/spawn_file_actions.c src/lib/spawn_file_actions.c
index fbeeb18..640ad4d 100644
--- a/src/lib/spawn_file_actions.c
+++ b/src/lib/spawn_file_actions.c
@@ -68,7 +68,7 @@ lfp_spawn_file_actions_init(lfp_spawn_file_actions_t *file_actions)
     SYSCHECK(EINVAL, file_actions == NULL);
     SYSGUARD(lfp_getrlimit(RLIMIT_NOFILE, &limit));

-    return _lfp_spawn_file_actions_init(file_actions, limit.rlim_max);
+    return _lfp_spawn_file_actions_init(file_actions, limit.rlim_cur);
 }

 static void
