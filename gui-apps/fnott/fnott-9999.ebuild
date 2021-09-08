EAPI=7

inherit eutils meson git-r3

DESCRIPTION="Keyboard driven and lightweight Wayland notification daemon for wlroots-based compositors."
HOMEPAGE="https://codeberg.org/dnkl/fnott/"
EGIT_REPO_URI="https://codeberg.org/dnkl/fnott.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86"

IUSE=""

RDEPEND="
    sys-apps/dbus
    dev-libs/wayland
    dev-libs/wayland-protocols
    media-libs/libpng
    media-libs/fontconfig
    x11-libs/libxkbcommon
    x11-libs/pixman
    dev-libs/fcft
    gui-libs/wlroots
"
DEPEND="${RDEPEND}"
BDEPEND="${RDEPEND}
	dev-util/meson
	dev-util/ninja
	dev-libs/tllist
	app-text/scdoc
"
