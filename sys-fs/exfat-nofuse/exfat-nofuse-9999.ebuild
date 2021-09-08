EAPI=6

inherit linux-info linux-mod git-r3

DESCRIPTION="ExFAT FS support"
# HOMEPAGE="https://github.com/rxrz/exfat-nofuse.git"
HOMEPAGE="https://github.com/barrybingo/exfat-nofuse"

#EGIT_REPO_URI="git://github.com/rxrz/exfat-nofuse.git"
EGIT_REPO_URI="https://github.com/barrybingo/exfat-nofuse"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

MODULE_NAMES="exfat(misc:${S})"
BUILD_TARGETS="all"

src_compile(){
    BUILD_PARAMS="KDIR=${KV_OUT_DIR} M=${S} EXTRA_FLAGS='-O2 -pipe' -f Makefile"
    linux-mod_src_compile
}