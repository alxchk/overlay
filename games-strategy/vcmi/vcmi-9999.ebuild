# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils games cmake-utils git-r3

DESCRIPTION="Heroes of Might and Magic III game engine rewrite"
HOMEPAGE="http://forum.vcmi.eu/index.php"
EGIT_REPO_URI="https://github.com/vcmi/vcmi "

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

DEPEND=">dev-libs/boost-1.44.0
		media-libs/libsdl2[video]
		media-libs/sdl2-mixer
		media-libs/sdl2-image
		media-libs/sdl2-ttf
		sys-libs/zlib
		virtual/ffmpeg
		virtual/pkgconfig
		dev-qt/qtwidgets:5
		dev-qt/qtnetwork:5
		dev-qt/qtcore:5
		dev-qt/qtgui:5"
RDEPEND="media-libs/libsdl[video]
        media-libs/sdl2-mixer
        media-libs/sdl2-image
        media-libs/sdl2-ttf
		dev-qt/qtcore:5
		dev-qt/qtnetwork:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		virtual/ffmpeg"

src_configure() {
	local MY_DATADIR="${GAMES_DATADIR#/usr/}/${PN}"
	local MY_GAMESLIBDIR=$(games_get_libdir)
	local MY_LIBDIR=${MY_GAMESLIBDIR#/usr/}
	local MY_BINDIR=${GAMES_BINDIR#/usr/}
    local mycmakeargs=( -DDATA_DIR="${MY_DATADIR}" -DLIB_DIR="${MY_LIBDIR}"	-DBIN_DIR="${MY_BINDIR}" )

	cmake-utils_src_configure
}

src_install() {
    cmake-utils_src_install
    prepgamesdirs
}

pkg_postinst() {
    games_pkg_postinst

	elog For the game to work properly, please copy your 
	elog \"Heroes Of Might and Magic: The Wake  Of Gods\" 
	elog game directory into ${GAMES_DATADIR}/${PN} .
	elog For more information, please visit:
	elog http://wiki.vcmi.eu/index.php?title=Installation_on_Linux
}
