# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="HEIC loader for imlib"
HOMEPAGE="https://github.com/vi/imlib2-heic"
EGIT_REPO_URI="https://github.com/vi/imlib2-heic"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm ~hppa ~ppc ~ppc64 x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x64-solaris ~x86-solaris"

RDEPEND="media-libs/libheif"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

