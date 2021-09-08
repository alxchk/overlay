EAPI=7

inherit git-r3 libtool autotools

HOMEPAGE="https://github.com/alperakcan/fuse-ext2"
DESCRIPTION="FUSE module to mount ext2, ext3 and ext4 file system"
EGIT_REPO_URI="https://github.com/alperakcan/fuse-ext2.git"

SLOT=0

DEPEND_COMMON="
sys-fs/e2fsprogs
sys-libs/e2fsprogs-libs
"

DEPEND="
$DEPEND_COMMON
sys-devel/libtool
sys-devel/autoconf
sys-devel/automake
"

src_prepare() {
    eapply_user
    eautoreconf -i
}
