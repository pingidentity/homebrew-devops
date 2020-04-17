class PingDevops < Formula
  desc "PingIdentity DevOps Command-Line Tool"
  homepage "https://devops.pingidentity.com"
  url "https://github.com/pingidentity/ping-devops/archive/v0.5.2.tar.gz"
  sha256 "6264d65a445fe3c3f01ffd537f2210f071f61bfcb56e8c06ead2800615e66ec7"

  depends_on "kubernetes-cli"
  depends_on "kubectx"
  depends_on "kustomize"
  depends_on "gettext"
  depends_on "stern"
  depends_on "jq"

  def install
    bin.install "ping-devops"
    etc.install "etc/bash_profile.ping-devops"

  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ping-devops -h 2>&1")
  end
end
