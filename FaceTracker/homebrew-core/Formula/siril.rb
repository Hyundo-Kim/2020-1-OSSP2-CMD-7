class Siril < Formula
  desc "Astronomical image processing tool"
  homepage "https://www.siril.org"
  url "https://free-astro.org/download/siril-0.9.12.tar.bz2"
  sha256 "9fb7f8a10630ea028137e8f213727519ae9916ea1d88cd8d0cc87f336d8d53b1"
  revision 3
  head "https://gitlab.com/free-astro/siril.git"

  bottle do
    sha256 "985adf89b28008b36d2b904f042f9b2b11d5a9c97b3e7f843843cfc1a01ba63f" => :catalina
    sha256 "f0a5255a907ab4146edde7ca7e45d82c72f980aa71b3b6d036e53f6b8f2c9f6b" => :mojave
    sha256 "ab6447ddc23c2a6a644b7fe706a91eed62b10548f05dfd210437d1c2738b5df0" => :high_sierra
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "intltool" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "adwaita-icon-theme"
  depends_on "cfitsio"
  depends_on "ffms2"
  depends_on "fftw"
  depends_on "gnuplot"
  depends_on "gsl"
  depends_on "gtk-mac-integration"
  depends_on "jpeg"
  depends_on "libconfig"
  depends_on "libomp"
  depends_on "libraw"
  depends_on "librsvg"
  depends_on "libsvg"
  depends_on "netpbm"
  depends_on "opencv"
  depends_on "openjpeg"

  def install
    # siril uses pkg-config but it has wrong include paths for several
    # headers. Work around that by letting it find all includes.
    ENV.append_to_cflags "-I#{HOMEBREW_PREFIX}/include -Xpreprocessor -fopenmp -lomp"

    system "./autogen.sh", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/siril", "-v"
  end
end
