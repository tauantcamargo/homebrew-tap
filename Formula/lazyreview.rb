class Lazyreview < Formula
  desc "TUI code review tool for GitHub PRs"
  homepage "https://github.com/tauantcamargo/lazyreview"
  url "https://registry.npmjs.org/lazyreview/-/lazyreview-1.0.23.tgz"
  sha256 "adb3fcfb3b18018a9a6abb4e8487b6a67a5ccf21081b40a98bcc1a2fcafdeb57"
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
