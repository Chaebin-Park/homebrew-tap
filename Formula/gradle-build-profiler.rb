# homebrew-tap/Formula/gradle-build-profiler.rb에 복사하세요

class GradleBuildProfiler < Formula
  desc "Analyze Gradle build profiles and provide performance insights"
  homepage "https://github.com/Chaebin-Park/GradleBuildProfiler"
  url "https://github.com/Chaebin-Park/GradleBuildProfiler/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7f9ecbba30206febe2c482951f11bc5e8a68d27f8b899988bcb17366ed3631f7"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    assert_match "gradle-profiler", shell_output("#{bin}/gradle_build_profiler --help")
  end
end
