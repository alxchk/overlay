EAPI=5

inherit eutils subversion
DESCRIPTION="YAFFS extractor"
HOMEPAGE="http://code.google.com/p/unyaffs/"
ESVN_REPO_URI="http://unyaffs.googlecode.com/svn/trunk/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_compile(){
    gcc -o unyaffs unyaffs.c ${CFLAGS} ${LDFLAGS}
}

src_install(){
    dobin unyaffs
}
