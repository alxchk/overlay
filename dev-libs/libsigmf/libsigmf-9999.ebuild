# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="C++ library for working with SigMF metadata"
HOMEPAGE="https://github.com/f4exb/libsigmf"

EGIT_REPO_URI="https://github.com/f4exb/libsigmf.git refs/heads/new-namespaces"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3+"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND=""
BDEPEND="virtual/pkgconfig"
