TERMUX_PKG_HOMEPAGE=https://github.com/lifegpc/pixiv_downloader
TERMUX_PKG_DESCRIPTION="A pixiv downloader written in Rust"
TERMUX_PKG_LICENSE="AGPL-3.0"
TERMUX_PKG_MAINTAINER="lifegpc"
_COMMIT=9493f475dfd50c92e34dfdffbbdb10dd2a8bca80
TERMUX_PKG_VERSION="0.0.0-56-g${_COMMIT:0:8}"
TERMUX_PKG_SRCURL=https://github.com/lifegpc/pixiv_downloader.git
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_DEPENDS="exiv2-git, ffmpeg, libzip"
TERMUX_PKG_LICENSE_FILE="LICENSE"

termux_step_post_get_source() {
    cd $TERMUX_PKG_SRCDIR
    git config uploadpack.allowReachableSHA1InWant true
    git fetch origin "$_COMMIT"
    git checkout $_COMMIT
}

termux_step_configure() {
    cd $TERMUX_PKG_SRCDIR
    termux_setup_cmake
    termux_setup_rust
    # cargo clean
}

termux_step_make() {
    cd $TERMUX_PKG_SRCDIR
    export CMAKE_PREFIX_PATH=$TERMUX_PREFIX
    export RUSTFLAGS="-C link-arg=-lc++ -C link-arg=-Wl,--enable-new-dtags -C link-arg=-Wl,-rpath=$TERMUX_PREFIX/lib"
    cargo build --jobs $TERMUX_MAKE_PROCESSES --features all --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
    cd $TERMUX_PKG_SRCDIR
    install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/pixiv_downloader
    python3 scripts/gen_mo.py -o $TERMUX_PREFIX/bin
}

