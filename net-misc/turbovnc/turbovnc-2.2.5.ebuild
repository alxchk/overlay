# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake

DESCRIPTION="A fast replacement for tigetvnc"
HOMEPAGE="https://www.turbovnc.org/"
SRC_URI="https://github.com/TurboVNC/${PN}/archive/${PV}.tar.gz"
RESTRICT="primaryuri"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/jdk:1.8
	>=media-libs/libjpeg-turbo-2.0.0[java]
	!net-misc/tigervnc"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DTJPEG_JAR=/usr/share/java/turbojpeg.jar
		-DTJPEG_JNILIBRARY=/usr/lib64/libturbojpeg.so
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	find "${D}/usr/share/man/man1/" -name Xserver.1\* -print0 | xargs -0 rm
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
