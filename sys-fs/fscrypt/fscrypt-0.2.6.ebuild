EAPI=7

EGO_PN="github.com/google/fscrypt"

EGO_VENDOR=(
	"github.com/client9/misspell v0.3.4"
	"github.com/golang/protobuf v1.2.0"
	"github.com/pkg/errors v0.8.0"
	"github.com/urfave/cli v1.20.0"
	"github.com/wadey/gocovmerge b5bfa59ec0adc420475f97f89b58045c721d761c"
	"golang.org/x/crypto cbcb75029529 github.com/golang/crypto"
	"golang.org/x/lint 16217165b5de github.com/golang/lint"
	"golang.org/x/sys 63cb32ae39b2 github.com/golang/sys"
	"golang.org/x/tools 2077df36852e github.com/golang/tools"
	"honnef.co/go/tools v0.0.1-2019.2.3 github.com/dominikh/go-tools"
)

inherit golang-build golang-vcs-snapshot

HOMEPAGE="https://${EGO_PN}"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

DESCRIPTION="Go tool for managing Linux filesystem encryption"
SLOT="0"
LICENSE="Apache-2.0"

DEPEND="
    >=dev-lang/go-1.6
    dev-libs/protobuf-c
    dev-libs/protobuf
"

S=${WORKDIR}/${P}/src/${EGO_PN}

src_prepare() {
    eapply "${FILESDIR}/remove-root-restriction.patch"
    eapply_user
}

src_compile() {
    emake GO_FLAGS="-mod=vendor -v -work -x ${EGO_BUILD_FLAGS}" || die
}

src_install() {
    dobin ${S}/bin/fscrypt
    insinto /lib/security
    doins ${S}/bin/pam_fscrypt.so
}
