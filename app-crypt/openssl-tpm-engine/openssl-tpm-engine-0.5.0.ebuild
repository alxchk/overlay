EAPI=7

inherit autotools

DESCRIPTION="OpenSSL integration with TSS engine for TPM1.1"
HOMEPAGE="https://github.com/mgerstner/openssl_tpm_engine"
SRC_URI="https://github.com/mgerstner/openssl_tpm_engine/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SLOT=0
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/openssl_tpm_engine-${PV}"

PATCHES=(
    "${FILESDIR}"/0001-Update-configure.ac-to-more-recent-format.patch
    "${FILESDIR}"/0002-Add-support-for-well-known-zeroed-key.patch
    "${FILESDIR}"/0003-Add-missing-files-for-autoreconf-2.71.patch
)

src_prepare() {
    eapply "${PATCHES[@]}"
    eapply_user
    eautoreconf -i
}

