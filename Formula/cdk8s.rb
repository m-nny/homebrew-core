require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.37.tgz"
  sha256 "0b2389d99a246cd78cec7daeb3f734f84833cf6fb7c09156d57bdb9543dc2199"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "f8634d4d5291a78eaba17bceef296ac6e1e4b5ffea3e557b0933e836e194a6ad"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
