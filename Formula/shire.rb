class Shire < Formula
  desc "Observability platform for laptop servers and power users"
  homepage "https://github.com/abigailzeke/project-shire"
  url "https://github.com/abigailzeke/project-shire/releases/download/v0.2.0/project_shire-0.2.0-py3-none-any.whl", using: :nounzip
  version "0.2.0"
  sha256 "1eb3b5b5802e2fe2b9fcdba916ee19be59d2f886f6a5459eef6c23cfce7fb3e0"
  license "MIT"

  depends_on :macos
  depends_on "python@3.14"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    system python, "-m", "venv", libexec
    system libexec/"bin/python", "-m", "pip", "install", "--disable-pip-version-check", Dir["*.whl"].first
    bin.install_symlink libexec/"bin/shire"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shire --version")
  end
end
