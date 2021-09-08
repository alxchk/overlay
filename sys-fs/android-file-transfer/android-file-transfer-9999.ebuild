EAPI=6

inherit eutils git-r3 cmake-utils

DESCRIPTION="Yet another MTP implementation"
HOMEPAGE="https://github.com/whoozle/android-file-transfer-linux"
EGIT_REPO_URI="https://github.com/whoozle/android-file-transfer-linux.git"
LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-qt/qtgui sys-fs/fuse sys-libs/readline"
