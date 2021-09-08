EAPI=7

inherit eutils meson git-r3

DESCRIPTION="A simple library for font loading and glyph rasterization using FontConfig, FreeType and pixman."
HOMEPAGE="https://codeberg.org/dnkl/fcft/"
EGIT_REPO_URI="https://codeberg.org/dnkl/fcft.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86"

IUSE=""

RDEPEND="
    media-libs/fontconfig
    media-libs/freetype
    media-libs/harfbuzz
    x11-libs/libxkbcommon
    x11-libs/pixman	
"
DEPEND="${RDEPEND}
	dev-util/meson
	dev-util/ninja
	dev-libs/tllist
"
