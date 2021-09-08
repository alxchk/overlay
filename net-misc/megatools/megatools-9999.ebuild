# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3 meson

DESCRIPTION="Command line tools and C library for accessing Mega cloud storage"
HOMEPAGE="https://github.com/megous/megatools"
EGIT_REPO_URI="https://megous.com/git/megatools"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

COMMON_DEPEND="dev-libs/glib:2
	dev-libs/openssl:0=
	net-misc/curl
"
RDEPEND="${COMMON_DEPEND}
	net-libs/glib-networking[ssl]
"
DEPEND="${COMMON_DEPEND}
	virtual/pkgconfig
	app-text/asciidoc"
