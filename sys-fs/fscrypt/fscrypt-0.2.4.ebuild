EAPI=7

EGO_PN="github.com/google/fscrypt"

inherit golang-build

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
    dev-go/go-crypto
    dev-go/go-tools
"

src_prepare() {
    eapply "${FILESDIR}/remove-root-restriction.patch"
    eapply_user
    mkdir -p ${WORKDIR}/go-path/src/github.com/google
    ln -sf ${S} ${WORKDIR}/go-path/src/github.com/google/fscrypt
    rm -rf ${S}/vendor/golang.org/x
    for dir in ${S}/vendor/*; do cp -rs $dir ${WORKDIR}/go-path/src/; done
}

src_compile() {
    ego_pn_check
    export GOPATH="${WORKDIR}/go-path:$(get_golibdir_gopath)"
    export GOCACHE="${T}/go-cache"
    emake || die
}

src_install() {
    dobin ${S}/bin/fscrypt
    insinto /lib/security
    doins ${S}/bin/pam_fscrypt.so
}
