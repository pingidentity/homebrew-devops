class PingDevops < Formula
  desc "PingIdentity DevOps Command-Line Tool"
  homepage "https://devops.pingidentity.com"
  url "https://github.com/pingidentity/ping-devops/archive/v0.1.tar.gz"
  sha256 "26157bb64f6e66273c841d64c86c010a811b6ed357fc4e8b833c2c4874aea059"

  depends_on "kubernetes-cli"

  def install
    bin.install "ping-devops"

  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ping-devops -h 2>&1")
  end
end
