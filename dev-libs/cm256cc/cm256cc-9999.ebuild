# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="Fast GF(256) Cauchy MDS Block Erasure Codec in C++ "
HOMEPAGE="https://github.com/f4exb/cm256cc"

EGIT_REPO_URI="https://github.com/f4exb/cm256cc.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

RDEPEND="dev-libs/boost"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"


