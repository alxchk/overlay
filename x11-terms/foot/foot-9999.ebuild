EAPI=7

inherit eutils meson git-r3

DESCRIPTION="Light-weight terminal emulator for wayland"
HOMEPAGE="https://codeberg.org/dnkl/foot/"
EGIT_REPO_URI="https://codeberg.org/dnkl/foot.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86"

IUSE=""

RDEPEND="
    dev-libs/wayland
    dev-libs/wayland-protocols
    media-libs/fontconfig
    x11-libs/libxkbcommon
    x11-libs/pixman
	dev-libs/fcft
"
DEPEND="${RDEPEND}
	dev-util/meson
	dev-util/ninja
	dev-libs/tllist
"
