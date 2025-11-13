class GradleBuildProfiler < Formula
  desc "Analyze Gradle build profiles and provide performance insights"
  homepage "https://github.com/Chaebin-Park/gradle-build-profiler"
  url "https://github.com/Chaebin-Park/gradle-build-profiler/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "4cbb367053ac1206568b444ae56ddb0302cc5d252f68aa1d4bf34ea30bd499bb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
    # 짧은 별칭 추가
    bin.install_symlink "gradle-build-profiler" => "gbp"
  end

  test do
    assert_match "gradle-profiler", shell_output("#{bin}/gradle-build-profiler --help")
    assert_match "gradle-profiler", shell_output("#{bin}/gbp --help")
  end
end
