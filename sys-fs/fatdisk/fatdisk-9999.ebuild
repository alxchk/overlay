EAPI=5

inherit eutils git-r3

DESCRIPTION="C code utility to modify DOS disks in place without mounting"
HOMEPAGE="https://github.com/goblinhack/fatdisk"
EGIT_REPO_URI="https://github.com/goblinhack/fatdisk.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

src_compile() {
    ./RUNME || die
}

src_install() {
    bin=`readlink -f fatdisk`
    rm -f fatdisk
    mv ${bin} fatdisk
    dobin fatdisk
}