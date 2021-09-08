EAPI=7

inherit meson git-r3

DESCRIPTION="Per-window keyboard layout for Sway"
HOMEPAGE="https://github.com/artemsen/swaykbdd"
EGIT_REPO_URI="https://github.com/artemsen/swaykbdd.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

IUSE=""

DEPEND="gui-wm/sway
	dev-libs/json-c"
RDEPEND="${DEPEND}"
