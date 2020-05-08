class PingDevops < Formula
  desc "PingIdentity DevOps Command-Line Tool"
  homepage "https://devops.pingidentity.com"
  url "https://github.com/pingidentity/ping-devops/archive/v0.6.2.tar.gz"
  sha256 "743f446ec3d432501dc070f05fa43d3c63513bcbfdc2607f394b89a493da82fe"

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

  # move previous version of etc/bash_profile.ping-devops
  def move_profile
    old_profile = etc/"bash_profile.ping-devops"
    new_profile = etc/"bash_profile.ping-devops.default"
    # Else, we're already using the latest version:
    return unless new_profile.exist?

    backup = etc/"bash_profile.ping-devops.old"
    opoo "Existing bash_profile.ping-devops will be moved to #{backup}."
    mv old_profile, backup
    mv new_profile, old_profile
  end

  def post_install
    move_profile
    ohai "Verify your existing Ping Identity DevOps configs with"
    ohai "  ping-devops info"
    ohai "  ping-devops config"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ping-devops -h 2>&1")
  end
end
