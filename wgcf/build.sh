TERMUX_PKG_HOMEPAGE=https://github.com/ViRb3/wgcf
TERMUX_PKG_DESCRIPTION="🚤 Cross-platform, unofficial CLI for Cloudflare Warp"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="lifegpc"
TERMUX_PKG_VERSION=2.2.15
TERMUX_PKG_SRCURL=https://github.com/ViRb3/wgcf/archive/refs/tags/v2.2.15.tar.gz
TERMUX_PKG_SHA256=b12971018c40d0a04492a9da9e9fea393394291044045e0117ec292364de1b57

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
    cp wgcf $TERMUX_PREFIX/bin -v
}
