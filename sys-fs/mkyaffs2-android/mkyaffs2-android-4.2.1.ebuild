EAPI=5

inherit eutils git-2

DESCRIPTION="Build yaffs2 image compatible with AVD / Google Android SDK"
HOMEPAGE="https://android.googlesource.com/platform/external/yaffs2.git"
EGIT_REPO_URI="https://android.googlesource.com/platform/external/yaffs2.git"
EGIT_COMMIT="android-${PV}_r1"
SRC_URI="https://raw.github.com/cgjones/android-system-core/master/include/private/android_filesystem_config.h"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_unpack(){
    git-2_src_unpack
    cp "${DISTDIR}"/android_filesystem_config.h "${S}"/yaffs2/utils/ || die
}

src_prepare(){
    epatch "${FILESDIR}"/linux-build.patch
}

src_compile(){
    emake -C yaffs2/utils
}

src_install(){
    mv yaffs2/utils/mkyaffs2image yaffs2/utils/mkyaffs2image-android
    mv yaffs2/utils/mkyaffsimage yaffs2/utils/mkyaffsimage-android
    dobin yaffs2/utils/mkyaffs2image-android
    dobin yaffs2/utils/mkyaffsimage-android
}
