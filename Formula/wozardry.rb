class Wozardry < Formula
  desc "Multi-purpose tool for manipulating .woz disk images"
  homepage "https://github.com/a2-4am/wozardry"
  url "https://github.com/a2-4am/wozardry.git",
    :branch => "master",
    :revision => "6c3642ed862b6a81d19302f5af2fc2fa8c9582be"
  version "6c3642ed"
  sha256 "8a1088be1628f593c9d00b0e91d47a3820016d4d2b80a4b047cfedf61b34c9c4"
  head "https://github.com/a2-4am/wozardry.git", :branch => "master"

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
    (libexec/"wozardry").chmod 0755
    (bin/"wozardry").write_env_script("#{libexec}/wozardry", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/wozardry", "--version"
  end
end
