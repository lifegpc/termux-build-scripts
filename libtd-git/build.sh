TERMUX_PKG_HOMEPAGE=https://core.telegram.org/tdlib/
TERMUX_PKG_DESCRIPTION="Library for building Telegram clients"
TERMUX_PKG_LICENSE="BSL-1.0"
TERMUX_PKG_REPLACES=libtd
TERMUX_PKG_PROVIDES="tdlib, libtd"
_COMMIT=e86b323de94f616ef09d53a44b5c6d66ef4218ae
TERMUX_PKG_VERSION="1.8.0-690-g${_COMMIT:0:8}"
TERMUX_PKG_SRCURL="https://github.com/tdlib/td.git"
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_DEPENDS="readline, openssl (>= 1.1.1), zlib"
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_MAINTAINER=lifegpc

termux_step_post_get_source() {
    cd $TERMUX_PKG_SRCDIR
    git config uploadpack.allowReachableSHA1InWant true
    git fetch origin "$_COMMIT"
    git checkout $_COMMIT
}

termux_step_host_build() {
    termux_setup_cmake
    cmake "-DCMAKE_BUILD_TYPE=Release" "$TERMUX_PKG_SRCDIR"
    cmake --build . --target prepare_cross_compiling
}

termux_step_post_make_install() {
    # Fix rebuilds without ./clean.sh.
    rm -rf $TERMUX_PKG_HOSTBUILD_DIR
}

