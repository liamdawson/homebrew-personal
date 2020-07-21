class JmespathTerminal < Formula
  include Language::Python::Virtualenv

  desc "JMESPath exploration tool in the terminal"
  homepage "https://github.com/jmespath/jmespath.terminal"
  url "https://files.pythonhosted.org/packages/eb/f8/517e5f01e657b0ba384e133e0e6c92c577c96c57b3029b9d29b6baa3662f/jmespath-terminal-0.2.1.tar.gz"
  sha256 "60c538e6c0244d2b58d7ff470839b9742a91b74d685a6cbf2764a4895f133639"

  depends_on "python3"

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/3c/56/3f325b1eef9791759784aa5046a8f6a1aff8f7c898a2e34506771d3b99d8/jmespath-0.10.0.tar.gz"
    sha256 "b85d0567b8666149a93172712e68920734333c0ce7e89b78b3e987f71e5ed4f9"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/6e/4d/4d2fe93a35dfba417311a4ff627489a947b01dc0cc377a3673c00cf7e4b2/Pygments-2.6.1.tar.gz"
    sha256 "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
  end

  resource "urwid" do
    url "https://files.pythonhosted.org/packages/0c/6a/c6eceee1b52004d791b1249d798e3a6ef280a8ab5645b5e5246e8e73c7cb/urwid-1.2.2.tar.gz"
    sha256 "e122e2dee122314f5626945af4dbe15bf3de9f318c552a4c0b68c1c480852d92"
  end

  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/jpterm", "--help"
  end
end
