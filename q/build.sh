TERMUX_PKG_HOMEPAGE=https://github.com/natesales/q
TERMUX_PKG_DESCRIPTION="A tiny command line DNS client with support for UDP, DoT, DoH, DoQ and ODoH."
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_VERSION=0.8.0
TERMUX_PKG_SRCURL=https://github.com/natesales/q/archive/refs/tags/v0.8.0.tar.gz
TERMUX_PKG_LICENSE_FILE=LICENSE
TERMUX_PKG_SHA256=813d0a42a45a354a2c43af153ee1ceb8eae98ae7e61030cbfca68d779717b333

termux_step_make() {
    cd $TERMUX_PKG_SRCDIR
    case $TERMUX_ARCH in
    aarch64)
        GO_ARCH=arm64
    ;;
    i686)
        GO_ARCH=386
    ;;
    x86_64)
        GO_ARCH=amd64
    ;;
    *)
        GO_ARCH=$TERMUX_ARCH
    ;;
    esac
    env GOOS=android GOARCH=$GO_ARCH CGO_ENABLED=1 CC=$CC go build
}

termux_step_make_install() {
    cd $TERMUX_PKG_SRCDIR
    cp q $TERMUX_PREFIX/bin -v
}

