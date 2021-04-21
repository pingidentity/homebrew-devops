class Pingctl < Formula
  desc "pingctl - A PingIdentity CLI"
  homepage "https://pingidentity.github.io/pingctl"
  url "https://github.com/pingidentity/pingctl/archive/v0.9.3.tar.gz"
  sha256 "0ec48a6655025ef35dcccaddc1b3d71b16ccc67f17313658991b4966deca8014"

  depends_on "kubernetes-cli"
  depends_on "kubectx"
  depends_on "kustomize"
  depends_on "gettext"
  depends_on "stern"
  depends_on "jq"
  depends_on "mike-engel/jwt-cli/jwt-cli"
  depends_on "k9s"

  def install
    bin.install "pingctl"
  end

  def post_install
    ohai "Verify your existing Ping Identity pingctl configs with"
    ohai "  pingctl info"
    ohai "  pingctl config"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/pingctl 2>&1")
  end
end
