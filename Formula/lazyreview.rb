class Lazyreview < Formula
  desc "TUI code review tool for GitHub PRs"
  homepage "https://github.com/tauantcamargo/lazyreview"
  url "https://registry.npmjs.org/lazyreview/-/lazyreview-1.0.35.tgz"
  sha256 "a0f4477bde2823811239b2bf76859c1c63161e3685cba7f9c7d19ff5913d3590"
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
