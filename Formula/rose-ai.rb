class RoseAi < Formula
  include Language::Python::Virtualenv

  desc "Multi-provider AI coding orchestrator — pilot-shell for all providers"
  homepage "https://github.com/tauantcamargo/rose-ai"
  head "https://github.com/tauantcamargo/rose-ai.git", branch: "main"
  license "MIT"

  # Stable release — uncomment and fill sha256 when you tag v0.2.0:
  # url "https://github.com/tauantcamargo/rose-ai/archive/refs/tags/v0.2.0.tar.gz"
  # sha256 "FILL_ME"
  # version "0.2.0"

  depends_on "python@3.13"
  depends_on "uv" => :recommended

  def install
    venv = virtualenv_create(libexec, "python3.13")
    system libexec/"bin/pip", "install", "--no-deps", "."

    # Install runtime dependencies
    system libexec/"bin/pip", "install",
      "typer>=0.9",
      "rich>=13.0",
      "jinja2>=3.0",
      "tomli-w>=1.0",
      "pydantic>=2.0",
      "orjson>=3.0",
      "fastapi>=0.100",
      "uvicorn>=0.20"

    # Link the rose CLI into Homebrew's bin
    (bin/"rose").write_env_script libexec/"bin/rose", PATH: "#{libexec}/bin:#{ENV["PATH"]}"
  end

  def caveats
    <<~EOS
      To start rose-ai with your default provider:
        rose start

      To see available commands:
        rose --help

      Web dashboard runs at http://localhost:7878 during sessions.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/rose --help")
  end
end
