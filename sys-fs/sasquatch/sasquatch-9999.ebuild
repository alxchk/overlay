# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/squashfs-tools/squashfs-tools-4.2_p20121216.ebuild,v 1.2 2013/02/20 20:26:54 zmedico Exp $

EAPI=4
inherit eutils toolchain-funcs git-r3

DESCRIPTION="Tool for creating compressed filesystem type squashfs"
HOMEPAGE="http://squashfs.sourceforge.net"
EGIT_REPO_URI="https://github.com/devttys0/sasquatch.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~arm-linux ~x86-linux"
IUSE="-lzma +xz lzo xattr"

RDEPEND="
	sys-libs/zlib
	xz? ( app-arch/xz-utils )
	lzo? ( dev-libs/lzo )
	lzma? ( app-arch/xz-utils )
	!xz? ( !lzo? ( sys-libs/zlib ) )
	xattr? ( sys-apps/attr )"
DEPEND="${RDEPEND}"

use_sed() {
	local u=$1 s="${2:-`echo $1 | tr '[:lower:]' '[:upper:]'`}_SUPPORT"
	printf '/^#?%s =/%s\n' "${s}" \
		"$( use $u && echo s:.*:${s} = 1: || echo d )"
}

src_configure() {
	tc-export CC
	sed -i -r \
		-e "$(use_sed xattr XATTR)" \
		-e "$(use_sed lzma LZMA)" \
		-e "$(use_sed lzma LZO)" \
		-e "s@INSTALL_DIR = /usr/local/bin@INSTALL_DIR = /usr/bin@" \
		Makefile || die
}

src_install() {
	dobin sasquatch
}