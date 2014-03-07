require 'formula'

class GitMeta < Formula
  homepage 'https://github.com/renard/git-meta'
  head 'https://github.com/renard/git-meta.git'

  def install
    bin.install "git-meta"
    man1.install "git-meta.1"
  end

end
