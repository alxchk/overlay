# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="SDR Rx/Tx software"
HOMEPAGE="https://github.com/f4exb/sdrangel"

EGIT_REPO_URI="https://github.com/f4exb/sdrangel.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

RDEPEND="
dev-libs/cm256cc
dev-libs/dsdcc
dev-libs/libsigmf
dev-libs/serialdv
media-libs/mbelib
media-libs/codec2
dev-qt/qtcharts
dev-qt/qtspeech
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"


function pkg_postinst() {
	xdg_icon_cache_update
}

function pkg_postrm() {
	xdg_icon_cache_update
}
