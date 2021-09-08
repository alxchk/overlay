# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Still working as of JOSM 17084

EAPI=7

JAVA_ANT_ENCODING=UTF-8

[[ ${PV} == "99999" ]] && SUBVERSION_ECLASS="subversion"
ESVN_REPO_URI="https://josm.openstreetmap.de/svn/trunk"
inherit desktop eutils java-pkg-2 java-ant-2 ${SUBVERSION_ECLASS}
unset SUBVERSION_ECLASS

DESCRIPTION="Java-based editor for the OpenStreetMap project"
HOMEPAGE="https://josm.openstreetmap.de/"
[[ ${PV} == "99999" ]] || SRC_URI="mirror://gentoo/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"

# Don't move KEYWORDS on the previous line or ekeyword won't work # 399061
[[ ${PV} == "99999" ]] || \
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.8
	dev-java/ant-ivy:2"
RDEPEND=">=virtual/jre-1.8"

IUSE=""

pkg_setup() {
        if has network-sandbox $FEATURES; then
                eerror
                eerror "This ebuild requires that FEATURE 'network-sandbox'"
                eerror "be disabled, because JOSM needs to download"
                eerror "dependencies."
                eerror
                einfo
                einfo "Just add 'FEATURES=\"-network-sandbox\" sci-geosciences/josm'"
                einfo "into package.env."
                einfo
                die "network-sandbox is enabled"
        fi
}

src_prepare() {
	default
	if [[ ${PV} == "99999" ]]; then

		# create-revision needs the compile directory to be a svn directory
		# see also https://lists.openstreetmap.org/pipermail/dev/2009-March/014182.html
		sed -i \
			-e "s:arg[ ]value=\".\":arg value=\"${ESVN_STORE_DIR}\/${PN}\/trunk\":" \
			build.xml || die "Sed failed"
	fi
}

src_compile() {
	eant dist-optimized -DnoJavaFX=true
}

src_install() {
	java-pkg_newjar "dist/${PN}-custom-optimized.jar" "${PN}.jar" || die "java-pkg_newjar failed"
	java-pkg_dolauncher "${PN}" --jar "${PN}.jar" || die "java-pkg_dolauncher failed"

	newicon -s scalable build/images/logo.svg josm.svg
	newicon -t locolor -s "64" nodist/images/logo64.png josm.png
	newicon -t locolor -s "256" nodist/images/logo.png josm.png
	for s in 16 32 48; do
		newicon -s "$s" build/images/logo_${s}x${s}x32.png josm.png
		newicon -t locolor -s "$s" build/images/logo_${s}x${s}x8.png josm.png
	done || die "newicon failed"
	make_desktop_entry "${PN}" "Java OpenStreetMap Editor" josm "Utility;Science;Geoscience"
}
