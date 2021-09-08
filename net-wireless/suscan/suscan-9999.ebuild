# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
CMAKE_MAKEFILE_GENERATOR='emake'
inherit cmake git-r3

DESCRIPTION="a realtime DSP processing library"
HOMEPAGE="https://github.com/BatchDrake/suscan"
EGIT_REPO_URI="https://github.com/BatchDrake/suscan.git ref/heads/develop"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/libsndfile
	dev-libs/libxml2
	net-wireless/sigutils
	net-wireless/soapysdr:=
	sci-libs/fftw:3.0=
	sci-libs/volk:=
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -i "s@/lib/pkgconfig@/$(get_libdir)/pkgconfig@" CMakeLists.txt
	sed -i "s@DESTINATION lib@DESTINATION $(get_libdir)@" CMakeLists.txt
	cmake_src_prepare
}
