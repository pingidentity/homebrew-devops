class PingDevops < Formula
  desc "PingIdentity DevOps Command-Line Tool"
  homepage "https://devops.pingidentity.com"
  url "https://github.com/pingidentity/ping-devops/archive/v0.1.tar.gz"
  sha256 "4c8d61c3fa45950be4f308066b341dc68c4509a6f1f865f5b51527a28f7f6304"

  depends_on "kubernetes-cli"

  def install
    bin.install "ping-devops"

  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ping-devops -h 2>&1")
  end
end
