# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake-utils git-r3

DESCRIPTION="Remote support for Soapy SDR"
HOMEPAGE="https://github.com/pothosware/SoapyRemote"
EGIT_REPO_URI="https://github.com/pothosware/SoapyRemote.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
net-wireless/soapysdr
"
RDEPEND="${DEPEND}"
BDEPEND=""
