# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/networkmanager-pptp/networkmanager-pptp-0.9.6.0.ebuild,v 1.3 2013/01/27 12:47:42 ago Exp $

EAPI="6"

inherit git-r3 autotools

DESCRIPTION="NetworkManager iodine plugin"
HOMEPAGE="https://github.com/danfruehauf/NetworkManager-ssh"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gtk"

RDEPEND="
	net-misc/networkmanager
	net-misc/openssh
	net-misc/sshpass
	gnome-base/libgnome-keyring
	x11-libs/gtk+:3
"

DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/intltool
	virtual/pkgconfig"

SRC_URI=""
EGIT_REPO_URI="https://github.com/danfruehauf/NetworkManager-ssh"

src_prepare() {
	eautoreconf -i
	eapply_user
}
