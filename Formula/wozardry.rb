class Wozardry < Formula
  desc "Multi-purpose tool for manipulating .woz disk images"
  homepage "https://github.com/a2-4am/wozardry"
  url "https://github.com/a2-4am/wozardry/archive/1.0.tar.gz"
  head "https://github.com/a2-4am/wozardry.git", :branch => "master"
  sha256 "2f694c64afeb899975c200ce47cdea4d31811e1ca224804dda4d92952e0a9723"

  depends_on "python"

  resource "bitarray" do
    url "https://files.pythonhosted.org/packages/aa/ef/2eb38a90ad40d0451a5228e760505567ff4cd3d8a936341a43a885fa8aa0/bitarray-0.8.2.1.tar.gz"
    sha256 "94a1747208b7ef1debfd469657f2d4b74446e170ba735927207a525602ebf0cc"
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

  test do
    system "#{bin}/wozardry", "--version"
  end
end
