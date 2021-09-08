EAPI=5

inherit eutils git-2 autotools

DESCRIPTION="GSM-Sniffer project"
HOMEPAGE="http://git.gnumonks.org"
EGIT_REPO_URI="git://git.gnumonks.org/airprobe.git"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="net-libs/libosmocore
	net-wireless/gnuradio"
RDEPEND="${DEPEND}"

PROJECTS="gsm-receiver gsm-tvoid gsmdecode gsmsp gssm"

src_prepare() {
    
    epatch "${FILESDIR}"/AC_PROG_CXX.patch
    epatch "${FILESDIR}"/unistd.patch
    epatch "${FILESDIR}"/gnuradio.patch

    for p in ${PROJECTS}; do
	cd ${S}/${p} && eautoreconf -i
    done
}

src_configure() {
    for p in ${PROJECTS}; do
	cd ${S}/${p} && econf
    done
}

src_compile() {
    for p in ${PROJECTS}; do
	cd ${S}/${p} && emake
    done
}

src_install() {
    for p in ${PROJECTS}; do
	cd ${S}/${p} && emake DESTDIR=${D} install
    done
}
