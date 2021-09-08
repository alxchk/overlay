# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils xdg

DESCRIPTION="Video effects library based on web technologies"
HOMEPAGE="https://www.shotcut.org/ https://github.com/mltframework/webvfx/"


if [[ ${PV} == *9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mltframework/${PN}.git"
else
	SRC_URI="https://github.com/mltframework/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi


KEYWORDS="~amd64 ~x86"
LICENSE="BSD-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgraphicaleffects:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtquickcontrols:5[widgets]
	dev-qt/qtwebkit:5
	dev-qt/qtwebsockets:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	dev-qt/qt3d:5
	>=media-libs/mlt-6.10.0-r1[ffmpeg,frei0r,qt5,sdl,xml]
"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5 PREFIX="/usr"
}

src_install() {
	dolib.so build/release/libwebvfx.so{,.1,.1.2,.1.2.0}
	dobin build/release/webvfx_render
	dobin build/release/webvfx_viewer
	dobin build/release/webvfx_browser
	einstalldocs
}
