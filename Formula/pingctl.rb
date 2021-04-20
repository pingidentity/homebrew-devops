class Pingctl < Formula
  desc "pingctl - A PingIdentity CLI"
  homepage "https://pingidentity.github.io/pingctl"
  url "https://github.com/pingidentity/pingctl/archive/v0.9.0.tar.gz"
  sha256 "9b7e6b2eef0592641e4af5375a8db7958d34f05d4524feabfa952c067c2fe3b8"

  depends_on "kubernetes-cli"
  depends_on "kubectx"
  depends_on "kustomize"
  depends_on "gettext"
  depends_on "stern"
  depends_on "jq"
  depends_on "mike-engel/jwt-cli/jwt-cli"
  depends_on "derailed/k9s/k9s"

  def install
    bin.install "pingctl"
  end

  def post_install
    move_profile
    ohai "Verify your existing Ping Identity pingctl configs with"
    ohai "  pingctl info"
    ohai "  pingctl config"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/pingctl 2>&1")
  end
end
