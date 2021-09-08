# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit python-single-r1 cmake-utils git-r3

DESCRIPTION="Set of tools for receiving information transmitted by GSM equipment/devices"
HOMEPAGE="https://github.com/kit-cel/gr-lte"
EGIT_REPO_URI="https://github.com/kit-cel/gr-lte"

KEYWORDS=""
LICENSE="GPL-3"
SLOT="0"
IUSE="doc"

DEPEND=">=net-wireless/gnuradio-3.7.0:=
	dev-util/cppunit
	net-libs/libosmocore"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i "s|\${GR_DOC_DIR}\/\${CMAKE_PROJECT_NAME}|${EPREFIX}/usr/share/doc/${PF}|g" CMakeLists.txt
}

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_enable doc DOXYGEN) \
	)
	cmake-utils_src_configure
}
