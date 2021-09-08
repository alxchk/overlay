# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit git-r3 autotools

DESCRIPTION="Phone Simulator for modem testing"
HOMEPAGE="http://ofono.org/"
EGIT_REPO_URI="git://git.kernel.org/pub/scm/network/ofono/phonesim.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtscript
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
    eapply "${FILESDIR}/listen-localhost.patch"
    eapply_user
    eautoreconf -i
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc ChangeLog AUTHORS doc/*.txt
}
