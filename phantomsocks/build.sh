TERMUX_PKG_HOMEPAGE=https://github.com/Macronut/phantomsocks
TERMUX_PKG_DESCRIPTION="A proxy server for Linux/Windows/macOS with Pcap/RawSocket/WinDivert to modify packets."
TERMUX_PKG_LICENSE="LGPL-3.0"
_COMMIT=fdafc79cf4e41bb675e59786844bea442ce6c084
TERMUX_PKG_VERSION="0.167-${_COMMIT:0:8}"
TERMUX_PKG_SRCURL=https://github.com/Macronut/phantomsocks.git
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_BUILD_DEPENDS="libpcap"
TERMUX_PKG_LICENSE_FILE=LICENSE

termux_step_post_get_source() {
    cd $TERMUX_PKG_SRCDIR
    git checkout $_COMMIT
}

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
    cp phantomsocks $TERMUX_PREFIX/bin -v
}

