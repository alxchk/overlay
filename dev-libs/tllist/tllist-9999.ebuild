EAPI=7

inherit eutils meson git-r3

DESCRIPTION="A C header file only implementation of a typed linked list."
HOMEPAGE="https://codeberg.org/dnkl/tllist/"
EGIT_REPO_URI="https://codeberg.org/dnkl/tllist.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 ~arm arm64 hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86"

IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-util/meson
	dev-util/ninja
"
