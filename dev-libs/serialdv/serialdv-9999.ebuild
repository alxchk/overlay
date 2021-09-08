# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="C++ Minimal interface to encode and decode audio with AMBE3000 based devices in packet mode over a serial link."
HOMEPAGE="https://github.com/f4exb/serialDV"

EGIT_REPO_URI="https://github.com/f4exb/serialDV.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""
BDEPEND="virtual/pkgconfig"


