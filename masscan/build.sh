TERMUX_PKG_HOMEPAGE=https://github.com/robertdavidgraham/masscan
TERMUX_PKG_DESCRIPTION="TCP port scanner, spews SYN packets asynchronously, scanning entire Internet in under 5 minutes."
TERMUX_PKG_LICENSE="AGPL-3"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="lifegpc"
TERMUX_PKG_VERSION=1.3.2
_COMMIT=efc5f8bffc2b302b950be353ba44ce79520900d9
TERMUX_PKG_SRCURL=https://github.com/robertdavidgraham/masscan.git
TERMUX_PKG_GIT_BRANCH=$TERMUX_PKG_VERSION

termux_step_make() {
    cd $TERMUX_PKG_SRCDIR
    make CC=$CC SYS=Android CFLAGS='-D__TERMUX__' LDFLAGS="-lm -ldl -pthread" -j $TERMUX_MAKE_PROCESSES && make install
}
