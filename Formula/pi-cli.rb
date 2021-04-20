class PiCli < Formula
  desc "PingIdentity pi CLI"
  homepage "https://github.com/pingidentity/pi-cli"
  url "https://github.com/pingidentity/pi-cli/archive/v0.9.0.tar.gz"
  sha256 "139428d5f5dbaf606e58d84662977b2342842a72f252d7cc6bae9186866f71dc"

  depends_on "kubernetes-cli"
  depends_on "kubectx"
  depends_on "kustomize"
  depends_on "gettext"
  depends_on "stern"
  depends_on "jq"
  depends_on "mike-engel/jwt-cli/jwt-cli"
  depends_on "derailed/k9s/k9s"

  def install
    bin.install "pi"
  end

  def post_install
    move_profile
    ohai "Verify your existing Ping Identity pi configs with"
    ohai "  pi info"
    ohai "  pi config"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/pi 2>&1")
  end
end
