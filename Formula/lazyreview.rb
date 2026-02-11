class Lazyreview < Formula
  desc "TUI code review tool for GitHub PRs"
  homepage "https://github.com/tauantcamargo/lazyreview"
  url "https://registry.npmjs.org/lazyreview/-/lazyreview-0.1.16.tgz"
  sha256 "399451675ac9526f6372a2f5c2cf199dc405e14701ce804fcf0101d80ca4c009"
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
