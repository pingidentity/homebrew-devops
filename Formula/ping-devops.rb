class PingDevops < Formula
  desc "PingIdentity DevOps Command-Line Tool"
  homepage "https://devops.pingidentity.com"
  url "https://github.com/pingidentity/ping-devops/archive/v0.2.tar.gz"
  sha256 "133f7acbea4694cbe5962d482f6fff9a453fb6dc404bfe3c99556d18d8eeb45d"

  depends_on "kubernetes-cli"

  def install
    bin.install "ping-devops"
    etc.install "etc/bash_profile.ping-devops"

  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ping-devops -h 2>&1")
  end
end
