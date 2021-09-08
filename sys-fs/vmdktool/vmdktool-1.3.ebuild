EAPI=5

inherit eutils

DESCRIPTION="Utility converts raw filesystems to the VMDK format and vice versa."
HOMEPAGE="http://people.freebsd.org/~brian/vmdktool"
SRC_URI="http://people.freebsd.org/~brian/${PN}/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_compile() {
    emake CFLAGS="${CFLAGS} -D_GNU_SOURCE"
}

src_install() {
    dobin ${PN}
    doman ${PN}.8
}