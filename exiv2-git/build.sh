TERMUX_PKG_HOMEPAGE=https://exiv2.org/
TERMUX_PKG_DESCRIPTION="Exif, Iptc and XMP metadata manipulation library and tools"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="lifegpc"
_COMMIT=7ebf2a184e28bf638a39aa30ed3784c5035b668a
TERMUX_PKG_VERSION=0.27-2408-g${_COMMIT:0:8}
TERMUX_PKG_SRCURL=git+https://github.com/Exiv2/exiv2
TERMUX_PKG_DEPENDS="libandroid-support, libc++, libexpat, zlib"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_BREAKS="exiv2"
TERMUX_PKG_REPLACES="exiv2"

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DEXIV2_ENABLE_VIDEO=ON
-DEXIV2_ENABLE_BUILD_SAMPLES=OFF"

termux_step_post_get_source() {
    local TMP_CHECKOUT=$TERMUX_PKG_CACHEDIR/tmp-checkout
    rm -rf $TMP_CHECKOUT
    git clone --branch "$TERMUX_PKG_GIT_BRANCH" "${TERMUX_PKG_SRCURL:4}" $TMP_CHECKOUT
    cd $TMP_CHECKOUT
    git submodule update --init --recursive
    rm -rf $TERMUX_PKG_SRCDIR
	cp -Rf $TMP_CHECKOUT $TERMUX_PKG_SRCDIR
    cd $TERMUX_PKG_SRCDIR
    git checkout $_COMMIT
}

