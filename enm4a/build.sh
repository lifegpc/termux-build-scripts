TERMUX_PKG_HOMEPAGE=https://github.com/lifegpc/ffmpeg-study
TERMUX_PKG_DESCRIPTION="Convert file to m4a file."
TERMUX_PKG_LICENSE="AGPL-3.0"
TERMUX_PKG_VERSION=1.0.1.8
TERMUX_PKG_SRCURL=git+https://github.com/lifegpc/ffmpeg-study
TERMUX_PKG_GIT_BRANCH=master
TERMUX_PKG_DEPENDS="ffmpeg"
TERMUX_PKG_LICENSE_FILE="../LICENSE"

termux_step_post_get_source() {
    export "TERMUX_PKG_SRCDIR=$TERMUX_PKG_SRCDIR/enm4a"
}

