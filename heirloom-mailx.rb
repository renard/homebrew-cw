
class HeirloomMailx < Formula
  version '12.5'
  homepage 'http://heirloom.sourceforge.net/mailx.html'
  url "http://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_#{version}.orig.tar.gz"
  sha256 "015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad"

  depends_on "openssl"

  patch :DATA

  def install
    makevars = %W[
      PREFIX=#{prefix}
      SYSCONFDIR=#{etc}
      IPv16=-DHAVE_IPv6_FUNCS
      UCBINSTALL=/usr/bin/install
      SENDMAIL=/usr/sbin/sendmail
    ]

    inreplace "cmd1.c", '"pg"', '"less"'

    system "sh", "./makeconfig"
    system "make", "all", *makevars
    system "make", "install", *makevars

end

  test do
    system bin/"mailx", "-V"
  end
end

__END__
diff --git a/mailx.1 b/mailx.1
index 417ea04..a02e430 100644
--- a/mailx.1
+++ b/mailx.1
@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
 .TP
 .B ssl-method
 Selects a SSL/TLS protocol version;
-valid values are `ssl2', `ssl3', and `tls1'.
+valid values are `ssl3', and `tls1'.
 If unset, the method is selected automatically,
 if possible.
 .TP
diff --git a/openssl.c b/openssl.c
index b4e33fc..1409a48 100644
--- a/openssl.c
+++ b/openssl.c
@@ -216,9 +216,10 @@ ssl_select_method(const char *uhp)
 
 	cp = ssl_method_string(uhp);
 	if (cp != NULL) {
-		if (equal(cp, "ssl2"))
-			method = SSLv2_client_method();
-		else if (equal(cp, "ssl3"))
+
+		/* SSL version 2 disabled */
+
+		if (equal(cp, "ssl3"))
 			method = SSLv3_client_method();
 		else if (equal(cp, "tls1"))
 			method = TLSv1_client_method();
