# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-auth/pam_mount/pam_mount-2.13-r1.ebuild,v 1.1 2012/12/29 04:48:23 mattst88 Exp $

EAPI=7

inherit eutils multilib autotools git-r3

DESCRIPTION="A PAM module that can mount volumes for a user session"
HOMEPAGE="http://pam-mount.sourceforge.net"
EGIT_REPO_URI="git://git.code.sf.net/p/pam-mount/pam-mount"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

IUSE="crypt ssl selinux"

COMMON_DEPEND=">=sys-libs/pam-0.99
	>=sys-libs/libhx-3.12.1
	>=dev-libs/libxml2-2.6
	ssl? ( >=dev-libs/openssl-0.9.8 )
	selinux? ( sys-libs/libselinux )"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	app-arch/xz-utils"
RDEPEND="${COMMON_DEPEND}
	>=sys-apps/util-linux-2.20"

src_prepare() {
	eautoreconf -i
	eapply_user
}

src_configure() {
	econf --with-slibdir="/$(get_libdir)" \
			$(use_with ssl crypto) \
			$(use_with selinux)
}

src_install() {
	default
	use selinux || rm -r "${D}"/etc/selinux
	dodoc doc/*.txt
}
