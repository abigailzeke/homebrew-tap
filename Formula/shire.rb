class Shire < Formula
  desc "Extensible observability platform for always-on laptops and power users"
  homepage "https://github.com/abigailzeke/project-shire"
  url "https://github.com/abigailzeke/project-shire/releases/download/v0.2.1/project_shire-0.2.1-py3-none-any.whl", using: :nounzip
  version "0.2.1"
  sha256 "ddd2f7e4ce00bdb5ac30a0f905c3cd5a7ea5a7bd03d6247b333ab3f3b4684db9"
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
