EAPI=5

inherit eutils git-2 autotools

DESCRIPTION="Calibrate RTL-SDK for GSM BS"
HOMEPAGE="https://github.com/steve-m/kalibrate-rtl"
EGIT_REPO_URI="https://github.com/steve-m/kalibrate-rtl.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="net-wireless/rtl-sdr"
RDEPEND="${DEPEND}"

src_prepare(){
    eautoreconf -i
}

