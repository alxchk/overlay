# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Go support for Google's protocol buffers"
HOMEPAGE="https://github.com/golang/protobuf"
SRC_URI="https://github.com/golang/protobuf/archive/v${PV}.tar.gz -> ${P}.tar.gz"
# LICENSE omits licenses for EGO_VENDOR packages, since those are only
# test dependencies which are not used at runtime.
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
DEPEND="test? ( dev-libs/protobuf )"
RDEPEND=""
RESTRICT="!test? ( test )"
S=${WORKDIR}/${P#go-}

src_unpack() {
	if use test; then
		go-module_src_unpack
	else
		default
	fi
}

src_compile() {
	export GOBIN=${S}/bin
	default
}

src_install() {
	dobin "${GOBIN}"/*
	dodoc README.md
}
