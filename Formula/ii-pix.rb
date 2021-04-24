class IiPix < Formula
  desc "Convert images to Apple II Double Hi-Res format"
  homepage "https://github.com/KrisKennaway/ii-pix/"
  url "https://github.com/KrisKennaway/ii-pix.git",
    revision: "07a358d49be66a86d3e367c828d1bd5593f97005"
  version "20210315"
  head "https://github.com/KrisKennaway/ii-pix.git",
    branch: "main"

  depends_on "cython"
  depends_on "numpy"
  depends_on "python@3.9"

  resource "colour_science" do
    url "https://files.pythonhosted.org/packages/bd/03/01e82b56c297f304fd6026955099d6bd4932613416728e8b924b916f06b0/colour-science-0.3.16.tar.gz"
    sha256 "c39884ad5f0a9a498f285284e666eed203aa518d072cca0c20aca88a17bf237c"
  end

  resource "PIL" do
    url "https://files.pythonhosted.org/packages/60/f0/dd2eb7911f948bf529f58f0c7931f6f6466f711bd6f1d81a69dc4edd4e2a/Pillow-8.1.2.tar.gz"
    sha256 "b07c660e014852d98a00a91adfbe25033898a9d90a8f39beb2437d22a203fc44"
  end

  resource "PIL_Tools" do
    url "https://files.pythonhosted.org/packages/2a/db/95f8baec088a5118ac6c1ea1b7d584c022a98658afc434d449ab0549f1df/PIL-Tools-1.0.tar.gz"
    sha256 "6ae3039dcb6d764150b757c694d4db9976f73648cd777df1f29ceb3014cc2a19"
  end

  def install
    version = Language::Python.major_minor_version Formula["python@3.9"].opt_bin/"python3"
    ENV.append_path "PYTHONPATH", Formula["numpy"].opt_lib/"python#{version}/site-packages"
    ENV.append_path "PYTHONPATH", Formula["cython"].opt_libexec/"lib/python#{version}/site-packages"
    ENV.prepend_create_path "PYTHONPATH", lib/"python#{version}/site-packages"

    deps = resources.map(&:name).to_set
    deps.each do |r|
      resource(r).stage do
        system Formula["python@3.9"].opt_bin/"python3", *Language::Python.setup_install_args(libexec)
      end
    end

    system Formula["python@3.9"].opt_bin/"python3", "setup.py", "build_ext", "--inplace"

    libexec.install Dir["*py"]
    libexec.install Dir["*so"]

    (libexec/"ii-pix-convert").write <<~EOS
      #{Formula["python@3.9"].opt_bin/"python3"} #{libexec}/convert.py "$@"
    EOS

    (libexec/"ii-pix-precompute-distance").write <<~EOS
      #{Formula["python@3.9"].opt_bin/"python3"} #{libexec}/precompute_distance.py "$@"
    EOS

    (libexec/"ii-pix-convert").chmod 0755
    (libexec/"ii-pix-precompute-distance").chmod 0755
    (bin/"ii-pix-convert").write_env_script("#{libexec}/ii-pix-convert", PYTHONPATH: ENV["PYTHONPATH"])
    (bin/"ii-pix-precompute-distance").write_env_script("#{libexec}/ii-pix-precompute-distance",
                                                        PYTHONPATH: ENV["PYTHONPATH"])
  end

  def caveats
    <<~EOS
      This formula installs two executables:

          ii-pix-convert
          ii-pix-precompute-distance

      You need to create a `data` directory with ii-pix-precompute-distance,
      then run ii-pix-convert from the directory containing the `data` directory.

      To get started, type `ii-pix-convert -h`.
    EOS
  end

  test do
    system "#{bin}/ii-pix-convert", "--version"
  end
end
