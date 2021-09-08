EAPI=5

inherit eutils

DESCRIPTION="Ext2 FUSE module, part of ViewOS"
HOMEPAGE="http://sourceforge.net/projects/view-os/"
SRC_URI="http://downloads.sourceforge.net/project/view-os/${PN}/${PV}/${P}.tar.gz"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="sys-fs/fuse"
RDEPEND="${DEPEND}"
