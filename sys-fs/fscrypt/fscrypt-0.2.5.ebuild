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
"

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
