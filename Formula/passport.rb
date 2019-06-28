class Passport < Formula
  desc "Verification and copy program for Apple II .woz disk images"
  homepage "https://github.com/a2-4am/passport.py"
  url "https://github.com/a2-4am/passport.py.git",
    :revision => "88c3224f7299320c129d9a63253aaf195c4c48db"
  version "20190303" # As in `passport --version`
  head "https://github.com/a2-4am/passport.py.git", :branch => "master"

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
    (libexec/"passport.py").chmod 0755
    (bin/"passport").write_env_script("#{libexec}/passport.py", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  def caveats; <<~EOS
    To get started, type `passport -h`.
  EOS
  end

  test do
    system "#{bin}/passport", "--version"
  end
end
