require 'formula'

class AsciidocOdf < Formula
  homepage 'https://github.com/dagwieers/asciidoc-odf'
  url 'https://github.com/dagwieers/asciidoc-odf/tarball/master'
  sha1 'ecd738aa3ea98c3f9494df2621ffc556e55a60e7'
  version '0.1-20120418'

  def install
    system "make", "templates"
    system "make", "install", "DESTDIR=#{prefix}"
  end

  def patches
    # Fix Makefile since -D is not valid on OS X install(1) command
    DATA
  end

  def caveats; <<-EOS.undent
    asciidoc-odf export needs asciidoc CONF_DIR set to /usr/local/etc/asciidoc

    You still can run:

      sed -i -n 's,Cellar/asciidoc/[^/]*/,,p' $(which asciidoc)

    EOS
  end


end


__END__
--- a/Makefile	2012-08-13 16:26:11.000000000 +0200
+++ b/Makefile	2012-08-13 16:28:28.000000000 +0200
@@ -31,21 +31,26 @@
 
 install:
 	@echo "= Installing odp backend"
-	install -Dp -m0644 backends/odp/odp.conf $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/odp.conf
-	install -Dp -m0644 backends/odp/asciidoc.odp.styles $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/asciidoc.odp.styles
-	install -Dp -m0644 backends/odp/asciidoc.otp $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/asciidoc.otp
-	install -Dp -m0644 backends/odp/a2x-backend.py $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/a2x-backend.py
+	mkdir -p $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp
+	install -p -m0644 backends/odp/odp.conf $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/odp.conf
+	install -p -m0644 backends/odp/asciidoc.odp.styles $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/asciidoc.odp.styles
+	install -p -m0644 backends/odp/asciidoc.otp $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/asciidoc.otp
+	install -p -m0644 backends/odp/a2x-backend.py $(DESTDIR)$(sysconfdir)/asciidoc/backends/odp/a2x-backend.py
 	@echo "= Installing odt backend"
-	install -Dp -m0644 backends/odt/odt.conf $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/odt.conf
-	install -Dp -m0644 backends/odt/asciidoc.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/asciidoc.odt.styles
-	install -Dp -m0644 backends/odt/asciidoc.ott $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/asciidoc.ott
-	install -Dp -m0644 backends/odt/a2x-backend.py $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/a2x-backend.py
+	mkdir -p $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt
+	install -p -m0644 backends/odt/odt.conf $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/odt.conf
+	install -p -m0644 backends/odt/asciidoc.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/asciidoc.odt.styles
+	install -p -m0644 backends/odt/asciidoc.ott $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/asciidoc.ott
+	install -p -m0644 backends/odt/a2x-backend.py $(DESTDIR)$(sysconfdir)/asciidoc/backends/odt/a2x-backend.py
 	@echo "= Installing cv theme"
-	install -Dp -m0644 themes/cv/cv.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/themes/cv/cv.odt.styles
+	mkdir -p $(DESTDIR)$(sysconfdir)/asciidoc/themes/cv
+	install -p -m0644 themes/cv/cv.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/themes/cv/cv.odt.styles
 	@echo "= Installing hp theme"
-	install -Dp -m0644 themes/hp/hp.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/themes/hp/hp.odt.styles
+	mkdir -p $(DESTDIR)$(sysconfdir)/asciidoc/themes/hp
+	install -p -m0644 themes/hp/hp.odt.styles $(DESTDIR)$(sysconfdir)/asciidoc/themes/hp/hp.odt.styles
 	@echo "=Installing code filter"
-	install -Dp -m0755 filters/code/code-filter.py $(DESTDIR)$(sysconfdir)/asciidoc/filters/code/code-filter.py
+	mkdir -p $(DESTDIR)$(sysconfdir)/asciidoc/filters/code 
+	install -p -m0755 filters/code/code-filter.py $(DESTDIR)$(sysconfdir)/asciidoc/filters/code/code-filter.py
 ### Old cruft
 #	install -Dp -m0755 filters/line_break.py $(DESTDIR)$(sysconfdir)/asciidoc/filters/line_break.py
 #	install -Dp -m0644 filters/source/source-highlight-filter.conf $(DESTDIR)/asciidoc/filters/source/source-highlight-filter.conf
