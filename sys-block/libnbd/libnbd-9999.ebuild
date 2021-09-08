EAPI=7

PYTHON_COMPAT=( python3_7 python3_8 python3_9 )

inherit git-r3 autotools python-single-r1

HOMEPAGE="https://github.com/libguestfs/libnbd"
DESCRIPTION="NBD client library in userspace"
EGIT_REPO_URI="https://github.com/libguestfs/libnbd.git"

KEYWORDS="~amd64"

SLOT=0

COMMON_DEPS="
dev-libs/libxml2
sys-fs/fuse
"

RDEPEND="${COMMON_DEPS}"
DEPEND="
>=sys-devel/automake-1.16.1-r2
dev-ml/ocamlbuild
virtual/perl-Pod-Simple
${COMMON_DEPS}
"

function src_prepare() {
    eapply_user
    eautoreconf -i
}

src_configure() {
    econf --disable-golang || die
}

function src_install() {
    default
    python_optimize
}
