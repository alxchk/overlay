EAPI=7

EGO_PN="github.com/tvrzna/${PN}"

EGO_VENDOR=(
"github.com/msteinert/pam 913b8f8cdf8b"
)

inherit golang-vcs-snapshot golang-build

HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Dead simple CLI Display Manager on TTY"
SLOT="0"
LICENSE="MIT"

DEPEND="
    >=dev-lang/go-1.12
"

src_install() {
    dobin emptty
    doman src/github.com/tvrzna/emptty/res/emptty.1
    dodir /etc/emptty
    insinto /etc/emptty
    doins src/github.com/tvrzna/emptty/res/conf
    insinto /etc/pam
    doins src/github.com/tvrzna/emptty/res/pam
    insinto /lib/systemd/system
    newins src/github.com/tvrzna/emptty/res/systemd-service emptty.service
}
