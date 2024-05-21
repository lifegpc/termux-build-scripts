TERMUX_PKG_HOMEPAGE=https://github.com/lifegpc/ffmpeg_core
TERMUX_PKG_DESCRIPTION="A music player core which use ffmpeg and SDL"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="lifegpc"
_COMMIT=111062d10dcf29f06164b138e00dcf72ce1dfca4
TERMUX_PKG_VERSION="1.1.1"
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=git+https://github.com/lifegpc/ffmpeg_core
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_DEPENDS="ffmpeg, sdl2"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_NO_STRIP=true

TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DENABLE_SDL2=ON"

termux_step_get_source() {
    local TMP_CHECKOUT=$TERMUX_PKG_CACHEDIR/tmp-checkout
    rm -rf $TMP_CHECKOUT
    git clone --branch "$TERMUX_PKG_GIT_BRANCH" "${TERMUX_PKG_SRCURL:4}" $TMP_CHECKOUT
    cd $TMP_CHECKOUT
    rm -rf $TERMUX_PKG_SRCDIR
    cp -Rf $TMP_CHECKOUT $TERMUX_PKG_SRCDIR
    cd $TERMUX_PKG_SRCDIR
    git config uploadpack.allowReachableSHA1InWant true
    git fetch origin "$_COMMIT"
    git checkout $_COMMIT
    git submodule update --init --recursive
}

