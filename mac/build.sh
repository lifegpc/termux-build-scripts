TERMUX_PKG_HOMEPAGE="https://monkeysaudio.com/developers.html"
TERMUX_PKG_DESCRIPTION="Monkey's Audio is a fast and easy way to compress digital music."
TERMUX_PKG_LICENSE="see https://monkeysaudio.com/license.html"
TERMUX_PKG_LICENSE_FILE="Readme.txt"
TERMUX_PKG_MAINTAINER="lifegpc"
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_VERSION=8.17
TERMUX_PKG_SRCURL=https://monkeysaudio.com/files/MAC_SDK_817.zip
TERMUX_PKG_SHA256=1c7fb2469ff57056bd15581cbe4847226f26d4ad7e731a7ab4ad7ce97ed5e03e

termux_step_get_source() {
    curl -L "$TERMUX_PKG_SRCURL" -o tmp.zip || exit 1
    echo "\\$TERMUX_PKG_SHA256 *tmp.zip" > tmp.sha256 || exit 1
    sha256sum -c tmp.sha256 || exit 1
    unzip -q tmp.zip -d $TERMUX_PKG_SRCDIR || exit 1
    curl -L "https://github.com/lifegpc/cmake-for-other-projects/raw/master/MAC/7.22/CMakeLists.txt" -o $TERMUX_PKG_SRCDIR/CMakeLists.txt
}

