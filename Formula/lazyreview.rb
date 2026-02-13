class Lazyreview < Formula
  desc "TUI code review tool for GitHub PRs"
  homepage "https://github.com/tauantcamargo/lazyreview"
  url "https://registry.npmjs.org/lazyreview/-/lazyreview-1.0.41.tgz"
  sha256 "8b5ea1882267a0e1dead0c7d5047ae1b0d58a7fe08f695b0291056a857fd7fc3"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazyreview --version 2>&1", 1)
  end
end
