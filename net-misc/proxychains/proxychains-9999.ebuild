# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs git-r3

MY_PN=${PN}-ng
MY_P=${MY_PN}-${PV}

DESCRIPTION="force any tcp connections to flow through a proxy (or proxy chain)"
HOMEPAGE="https://github.com/rofl0r/proxychains-ng/"
EGIT_REPO_URI="https://github.com/rofl0r/proxychains-ng.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86"

src_configure() {
	# not autotools
	./configure \
		--prefix="${EPREFIX}"/usr \
		--libdir="${EPREFIX}"/usr/$(get_libdir) \
		--sysconfdir="${EPREFIX}"/etc \
		|| die

	sed -i "s/^\(LDSO_SUFFIX\).*/\1 = so.${PV}/" Makefile || die
	tc-export CC
}

src_install() {
	dobin proxychains4 proxychains4-daemon
	dodoc AUTHORS README TODO

	dolib.so lib${PN}4.so.${PV}
	dosym lib${PN}4.so.${PV} /usr/$(get_libdir)/lib${PN}4.so.${PV:0:1}
	dosym lib${PN}4.so.${PV} /usr/$(get_libdir)/lib${PN}4.so

	insinto /etc
	doins src/${PN}.conf
}
