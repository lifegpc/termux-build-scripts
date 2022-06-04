TERMUX_PKG_HOMEPAGE=https://core.telegram.org/bots
TERMUX_PKG_DESCRIPTION="Telegram Bot API server"
TERMUX_PKG_LICENSE="BSL-1.0"
_COMMIT=8a0f1dd730aa41ab7b792b9ff03d92b1c5022c9f
TERMUX_PKG_VERSION="6.0.2"
TERMUX_PKG_SRCURL="https://github.com/tdlib/telegram-bot-api.git"
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_DEPENDS="libc++, readline, openssl (>= 1.1.1), zlib"
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_MAINTAINER=lifegpc

termux_step_post_get_source() {
    cd $TERMUX_PKG_SRCDIR
    git config uploadpack.allowReachableSHA1InWant true
    git fetch origin "$_COMMIT"
    git checkout $_COMMIT
    git submodule update --init
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
