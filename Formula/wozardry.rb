class Wozardry < Formula
  desc "Multi-purpose tool for manipulating .woz disk images"
  homepage "https://github.com/a2-4am/wozardry"
  url "https://github.com/a2-4am/wozardry/archive/1.0.tar.gz"
  sha256 "2f694c64afeb899975c200ce47cdea4d31811e1ca224804dda4d92952e0a9723"
  head "https://github.com/a2-4am/wozardry.git", :branch => "master"

  depends_on "python"

  resource "bitarray" do
    url "https://files.pythonhosted.org/packages/e2/1e/b93636ae36d08d0ee3aec40b08731cc97217c69db9422c0afef6ee32ebd2/bitarray-0.8.3.tar.gz"
    sha256 "050cd30b810ddb3aa941e7ddfbe0d8065e793012d0a88cb5739ec23624b9895e"
  end

  def install
    xy = Language::Python.major_minor_version "python3"
    site_packages = libexec/"lib/python#{xy}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", site_packages

    deps = resources.map(&:name).to_set
    deps.each do |r|
      resource(r).stage do
        system "python3", *Language::Python.setup_install_args(libexec)
      end
    end

    libexec.install Dir["*"]
    (libexec/"wozardry.py").chmod 0755
    (bin/"wozardry").write_env_script("#{libexec}/wozardry.py", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  def caveats; <<~EOS
    To get started, type `wozardry -h`.
  EOS
  end

  test do
    system "#{bin}/wozardry", "--version"
  end
end
