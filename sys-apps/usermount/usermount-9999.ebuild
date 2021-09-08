EAPI=5

inherit eutils git-r3 systemd

DESCRIPTION="Trivial automounter via udisks-2"
HOMEPAGE="https://github.com/tom5760/usermount"
EGIT_REPO_URI="https://github.com/tom5760/usermount.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="sys-fs/udisks:2"
RDEPEND="${DEPEND}"
IUSE="systemd"

src_install() {
	dobin usermount
	if use systemd; then
		local INSDESTTREE
		insinto "$(systemd_get_userunitdir)"
		doins  "${FILESDIR}"/${PN}.service
  fi
}
