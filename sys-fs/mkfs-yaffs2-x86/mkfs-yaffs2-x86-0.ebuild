EAPI=5

inherit eutils

DESCRIPTION="Build yaffs2 image compatible with AVD"
SRC_URI="http://jiggawatt.org/badc0de/android/mkfs.yaffs2.x86.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack(){
    mkdir -p ${S}
    cd ${S}
    unpack mkfs.yaffs2.x86.tar.gz
}

src_install(){
    dobin mkfs.yaffs2.x86
}
