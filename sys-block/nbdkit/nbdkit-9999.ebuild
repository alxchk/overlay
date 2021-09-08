EAPI=7

inherit git-r3 autotools

HOMEPAGE="https://github.com/libguestfs/nbdkit"
DESCRIPTION="NBD server toolkit "
EGIT_REPO_URI="https://github.com/libguestfs/nbdkit.git"

SLOT=0

COMMON_DEPS="
>=net-libs/gnutls-3.3.0
sys-libs/zlib
app-arch/xz-utils
app-arch/zstd
net-misc/curl
>=net-libs/libssh-0.8.0
app-cdr/cdrtools
sys-fs/e2fsprogs
sys-libs/e2fsprogs-libs
sys-block/libnbd
"

RDEPEND="${COMMON_DEPS}"
DEPEND="
virtual/perl-Pod-Simple
${COMMON_DEPS}
"

src_prepare() {
    eapply_user
    eautoreconf -i
}

src_configure() {
    econf --disable-rust --disable-golang || die
}
