# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils multilib-minimal meson vala

DESCRIPTION="GObject wrapper for libusb"
HOMEPAGE="https://github.com/hughsie/libgusb"
SRC_URI="https://people.freedesktop.org/~hughsient/releases/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86"

IUSE="+introspection vala static-libs"
REQUIRED_USE="vala? ( introspection )"

RDEPEND="
	>=dev-libs/glib-2.44:2[${MULTILIB_USEDEP}]
	virtual/libusb:1[udev,${MULTILIB_USEDEP}]
	introspection? ( >=dev-libs/gobject-introspection-1.29:= )
"
DEPEND="${RDEPEND}
	dev-libs/libxslt
	dev-util/meson
	dev-util/gtk-doc-am
"

# Tests try to access usb devices in /dev
RESTRICT="test"

src_prepare() {
	eapply_user
	use vala && vala_src_prepare
}

src_configure() {
    	local emesonargs=(
		$(meson_use vala vapi)
	)
	meson_src_configure
}