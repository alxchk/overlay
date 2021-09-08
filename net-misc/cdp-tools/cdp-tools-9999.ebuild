EAPI=5

inherit eutils git-2

DESCRIPTION="Cisco discovery protocol tools"
HOMEPAGE="https://github.com/geocar/cdp-tools"
EGIT_REPO_URI="https://github.com/geocar/cdp-tools"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=""

src_install(){
    dosbin cdp-listen
    dosbin cdp-routemgr
    dosbin cdp-send
    dodoc README
}