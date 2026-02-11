class Lazyreview < Formula
  desc "TUI code review tool for GitHub PRs"
  homepage "https://github.com/tauantcamargo/lazyreview"
  url "https://registry.npmjs.org/lazyreview/-/lazyreview-0.1.15.tgz"
  sha256 "c9c70d3d5a98ff00fb9e86b35744b4e2fe63881b7d7c6a952ba75e3a25e7f4ef"
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
