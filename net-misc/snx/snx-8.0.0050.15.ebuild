EAPI=4

inherit eutils
DESCRIPTION="CheckPoint SSL Network Extender"
HOMEPAGE="https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=10656"
SRC_URI="Check_Point_SNX_R71_VPN-1_Gateway_Files.tgz"
RESTRICT="fetch strip"
LICENSE="EULA"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND="x86? ( 
	    virtual/libstdc++ 
	)
        amd64? ( 
    	    app-emulation/emul-linux-x86-compat 
    	)
        virtual/pam
        x11-libs/libX11"
RDEPEND="${DEPEND}"
S=${WORKDIR}

INSTALLER=snx_install_linux30.sh

src_configure() {
    sed -i $INSTALLER -e "s@/usr@${D}/usr@g;\
			  s@/etc@${D}/etc@g;\
			  s@TMP_DIR=/tmp@TMP_DIR=${WORKDIR}/@;
			  s@SNX\\\\ Installer@/bin/sh@;
			  s@ln -s \`which su\` /bin/sh@@;"
    
}

src_compile() {
    true
}

src_install() {
    mkdir -p ${D}/usr/bin
    mkdir -p ${D}/etc
    ./$INSTALLER
    rm -f ${D}/usr/bin/snx_uninstall
}
