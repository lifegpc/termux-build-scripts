TERMUX_PKG_HOMEPAGE=https://github.com/lifegpc/pixiv_downloader
TERMUX_PKG_DESCRIPTION="A pixiv downloader written in Rust"
TERMUX_PKG_LICENSE="AGPL-3.0"
TERMUX_PKG_MAINTAINER="lifegpc"
_COMMIT=670f55f3666ae386c7616a53439fb11de7f23a95
TERMUX_PKG_VERSION="0.0.0-963-g${_COMMIT:0:8}"
TERMUX_PKG_SRCURL=git+https://github.com/lifegpc/pixiv_downloader
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_DEPENDS="exiv2-git, ffmpeg, libzip"
TERMUX_PKG_LICENSE_FILE="LICENSE"

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

