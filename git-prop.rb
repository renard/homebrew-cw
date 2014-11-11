require 'formula'

class GitProp < Formula
  homepage 'https://github.com/renard/git-prop'
  head 'https://github.com/renard/git-prop.git'

  def install
    bin.install "git-prop"
    man1.install "git-prop.1"
  end

end
