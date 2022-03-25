TERMUX_PKG_HOMEPAGE=https://exiv2.org/
TERMUX_PKG_DESCRIPTION="Exif, Iptc and XMP metadata manipulation library and tools"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="lifegpc"
_COMMIT=5ed9fb4120c9dd376bb468403d9af2e30f3c2e64
TERMUX_PKG_VERSION=0.27-2261-g${_COMMIT:0:8}
TERMUX_PKG_SRCURL=https://github.com/Exiv2/exiv2.git
TERMUX_PKG_DEPENDS="libandroid-support, libc++, libexpat, zlib"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_BREAKS="exiv2"
TERMUX_PKG_REPLACES="exiv2"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DEXIV2_ENABLE_VIDEO=ON
-DEXIV2_ENABLE_BUILD_SAMPLES=OFF"

termux_step_post_get_source() {
    cd $TERMUX_PKG_SRCDIR
    git checkout $_COMMIT
}

