require 'formula'


class PythonMacfsevents < Formula
  homepage 'http://pypi.python.org/pypi/MacFSEvents'
  url 'http://pypi.python.org/packages/source/M/MacFSEvents/MacFSEvents-0.4.tar.gz'
  sha1 '0722aeea4b06a3d64a96875f2325ce1bdbf2591f'

  depends_on :python

  def patches
    # Fix KeyError in fsevents.py", line 167, in __call__:
    # snapshot = self.snapshots[path]
    DATA
  end


  def install
    python_ver = '2.7'
    python_site_package = "python#{python_ver}/site-packages"
    package = name
    ENV.prepend_create_path 'PYTHONPATH', libexec/python_site_package
    
    system 'python', *Language::Python.setup_install_args(libexec)
    site_packages = lib/python_site_package
    site_packages.mkpath
    (site_packages/"#{package}.pth").write <<-EOS.undent
        #{libexec}/lib/#{python_site_package}
    EOS
  end
end

__END__
--- a/fsevents.py	2015-10-26 01:03:29.000000000 +0100
+++ b/fsevents.py	2015-10-26 01:04:05.000000000 +0100
@@ -164,6 +164,8 @@
                 path = path.decode('utf-8')

             path = path.rstrip('/')
+            if not self.snapshots.has_key(path):
+                continue
             snapshot = self.snapshots[path]
             current = {}
             try:
