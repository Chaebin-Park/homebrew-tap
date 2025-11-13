class GradleDependencyAnalyzer < Formula
  desc "Analyze and visualize module dependencies in Android/Gradle projects"
  homepage "https://github.com/Chaebin-Park/gradle-dependency-analyzer"
  url "https://github.com/Chaebin-Park/gradle-dependency-analyzer/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    # 짧은 별칭 추가
    bin.install_symlink "gradle-dependency-analyzer" => "gda"
  end

  test do
    assert_match "gradle-dependency-analyzer", shell_output("#{bin}/gradle-dependency-analyzer --help")
    assert_match "gradle-dependency-analyzer", shell_output("#{bin}/gda --help")
  end
end
