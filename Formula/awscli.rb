class Awscli < Formula
  include Language::Python::Virtualenv

  desc "Official Amazon AWS command-line interface"
  homepage "https://aws.amazon.com/cli/"
  url "https://github.com/aws/aws-cli/archive/2.9.9.tar.gz"
  sha256 "9a93633233b0fba20d6917118e7f1928edadc69801388c48acdc1f6d521110c4"
  license "Apache-2.0"
  head "https://github.com/aws/aws-cli.git", branch: "v2"

  bottle do
    sha256 cellar: :any,                 arm64_ventura:  "c4036cf30a1f86a293d319459869f83311aa1603ce2801d6a874730aab2b05e5"
    sha256 cellar: :any,                 arm64_monterey: "a1b2f0c982a1e24240e8da625e3f1eeb89ba64495db8224b82130128b24df9f0"
    sha256 cellar: :any,                 arm64_big_sur:  "8a077e52dba9131031cc66e2eff153a301ba28627017cabf607837b30455bda6"
    sha256 cellar: :any,                 ventura:        "e4718c754685eb5fbfa66b41960c013fa2e43eb81826afe8fdba0cbfac1c775c"
    sha256 cellar: :any,                 monterey:       "1eec177866ced8eaf5ac74f0f4ed674aebd9e8c61655645dab1ebbfe285bf6fa"
    sha256 cellar: :any,                 big_sur:        "f65df5ba2de3ea0b84e735e45d041b5a77159c4b2c6cdb900f9045fffe2f3f7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "6f9f71c96c430c36657b9992265a74c57d70e5140c0445aa039159eb49311544"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build # for cryptography
  depends_on "docutils"
  depends_on "python@3.11"
  depends_on "six"

  uses_from_macos "mandoc"

  # Python resources should be updated based on setup.cfg. One possible way is:
  # 1. Run `pipgrip 'awscli @ #{url}' --sort`
  # 2. Ignore `six`. Update all other PyPI packages

  resource "awscrt" do
    url "https://files.pythonhosted.org/packages/3f/c2/c23a860956e8b8a815ad4c0d260d4ea393b33a1835b50303d006fd259f7e/awscrt-0.16.2.tar.gz"
    sha256 "093e4a9c70db963de4341fcdb2e39848d03a2b23f693da8067cf796b06047434"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/2b/a8/050ab4f0c3d4c1b8aaa805f70e26e84d0e27004907c5b8ecc1d31815f92a/cffi-1.15.1.tar.gz"
    sha256 "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/82/75/f2a4c0c94c85e2693c229142eb448840fba0f9230111faa889d1f541d12d/colorama-0.4.3.tar.gz"
    sha256 "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/e3/3f/41186b1f2fd86a542d399175f6b8e43f82cd4dfa51235a0b030a042b811a/cryptography-38.0.4.tar.gz"
    sha256 "175c1a818b87c9ac80bb7377f5520b7f31b3ef2a0004e2420319beadedb67290"
  end

  resource "distro" do
    url "https://files.pythonhosted.org/packages/a6/a4/75064c334d8ae433445a20816b788700db1651f21bdb0af33db2aab142fe/distro-1.5.0.tar.gz"
    sha256 "0e58756ae38fbd8fc3020d54badb8eae17c5b9dcbed388b17bb55b8a5928df92"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/37/34/c34c376882305c5051ed7f086daf07e68563d284015839bfb74d6e61d402/prompt_toolkit-3.0.28.tar.gz"
    sha256 "9f1cd16b1e86c2968f2519d7fb31dd9d669916f515612c269d14e9ed52b51650"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de/pycparser-2.21.tar.gz"
    sha256 "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "ruamel-yaml-clib" do
    url "https://files.pythonhosted.org/packages/d5/31/a3e6411947eb7a4f1c669f887e9e47d61a68f9d117f10c3c620296694a0b/ruamel.yaml.clib-0.2.7.tar.gz"
    sha256 "1f08fd5a2bea9c4180db71678e850b995d2a5f4537be0e94557668cf0f5f9497"
  end

  resource "ruamel-yaml" do
    url "https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c/ruamel.yaml-0.17.21.tar.gz"
    sha256 "8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c2/51/32da03cf19d17d46cce5c731967bf58de9bd71db3a379932f53b094deda4/urllib3-1.26.13.tar.gz"
    sha256 "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
  end

  resource "wcwidth" do
    url "https://files.pythonhosted.org/packages/89/38/459b727c381504f361832b9e5ace19966de1a235d73cdbdea91c771a1155/wcwidth-0.2.5.tar.gz"
    sha256 "c4d647b99872929fdb7bdcaa4fbe7f01413ed3d98077df798530e5b04f116c83"
  end

  def python3
    which("python3.11")
  end

  def install
    # Temporary workaround for Xcode 14's ld causing build failure (without logging a reason):
    # ld: fatal warning(s) induced error (-fatal_warnings)
    # Ref: https://github.com/python/cpython/issues/97524
    ENV.append "LDFLAGS", "-Wl,-no_fixup_chains" if DevelopmentTools.clang_build_version >= 1400

    # The `awscrt` package uses its own libcrypto.a on Linux. When building _awscrt.*.so,
    # Homebrew's default environment causes issues, which may be due to `openssl` flags.
    # This causes installation to fail while running `scripts/gen-ac-index` with error:
    # ImportError: _awscrt.cpython-39-x86_64-linux-gnu.so: undefined symbol: EVP_CIPHER_CTX_init
    # As workaround, add relative path to local libcrypto.a before openssl's so it gets picked.
    if OS.linux?
      python_version = Language::Python.major_minor_version(python3)
      ENV.prepend "CFLAGS", "-I./build/temp.linux-x86_64-#{python_version}/deps/install/include"
      ENV.prepend "LDFLAGS", "-L./build/temp.linux-x86_64-#{python_version}/deps/install/lib"
    end

    # setuptools>=60 prefers its own bundled distutils, which is incompatible with docutils~=0.15
    # Force the previous behavior of using distutils from the stdlib
    # Remove when fixed upstream: https://github.com/aws/aws-cli/pull/6011
    with_env(SETUPTOOLS_USE_DISTUTILS: "stdlib") do
      virtualenv_install_with_resources
    end
    pkgshare.install "awscli/examples"

    rm Dir[bin/"{aws.cmd,aws_bash_completer,aws_zsh_completer.sh}"]
    bash_completion.install "bin/aws_bash_completer"
    zsh_completion.install "bin/aws_zsh_completer.sh"
    (zsh_completion/"_aws").write <<~EOS
      #compdef aws
      _aws () {
        local e
        e=$(dirname ${funcsourcetrace[1]%:*})/aws_zsh_completer.sh
        if [[ -f $e ]]; then source $e; fi
      }
    EOS
  end

  def caveats
    <<~EOS
      The "examples" directory has been installed to:
        #{HOMEBREW_PREFIX}/share/awscli/examples
    EOS
  end

  test do
    assert_match "topics", shell_output("#{bin}/aws help")
    site_packages = libexec/Language::Python.site_packages(python3)
    assert_includes Dir[site_packages/"awscli/data/*"], "#{site_packages}/awscli/data/ac.index"
  end
end
