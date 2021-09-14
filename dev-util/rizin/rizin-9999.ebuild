EAPI=7

inherit git-r3 meson

HOMEPAGE="https://github.com/rizinorg/rizin"
DESCRIPTION="UNIX-like reverse engineering framework and command-line toolset"
EGIT_REPO_URI="https://github.com/rizinorg/rizin.git"

SDB_REPO_URI="https://github.com/rizinorg/sdb.git"
SDB_COMMIT="56ee2d7bdb14b38c658ba98cc1778be239007c46"

TREE_SITTER_REPO_URI="https://github.com/tree-sitter/tree-sitter.git"
TREE_SITTER_VERSION="0.19.5"
TREE_SITTER_COMMIT="v${TREE_SITTER_VERSION}"

TREE_SITTER_C_REPO_URI="https://github.com/rizinorg/tree-sitter-c.git"
TREE_SITTER_C_COMMIT="3dd21d9440ca39d8c201335b2f3a393db41aab36"
EGIT_OVERRIDE_BRANCH_RIZINORG_TREE_SITTER_C="bare-types-support"

SLOT="0"

DEPEND_COMMON="
dev-libs/xxhash
sys-apps/file
dev-libs/openssl
dev-libs/libuv
sys-libs/zlib
dev-libs/capstone
dev-libs/libzip
app-arch/lz4
dev-libs/tree-sitter
"
DEPEND="
virtual/pkgconfig
>dev-lang/python-3
"
RDEPEND="
${DEPEND_COMMON}
"

src_unpack() {
    default_src_unpack
    git-r3_src_unpack

    git-r3_fetch "$SDB_REPO_URI" "$SDB_COMMIT" "$SDB_COMMIT" 
    git-r3_checkout "$SDB_REPO_URI" "${S}/subprojects/sdb" "$SDB_COMMIT"

    git-r3_fetch "$TREE_SITTER_C_REPO_URI" "$TREE_SITTER_C_COMMIT" "$TREE_SITTER_C_COMMIT" 
    git-r3_checkout "$TREE_SITTER_C_REPO_URI" "${S}/subprojects/tree-sitter-c" "$TREE_SITTER_C_COMMIT"

    cp -v "${S}/subprojects/packagefiles/tree-sitter-c/"meson.build "${S}/subprojects/tree-sitter-c"/

    git-r3_fetch "$TREE_SITTER_REPO_URI" "$TREE_SITTER_COMMIT" "$TREE_SITTER_COMMIT" 
    git-r3_checkout "$TREE_SITTER_REPO_URI" "${S}/subprojects/tree-sitter-${TREE_SITTER_VERSION}" "$TREE_SITTER_COMMIT"

    cp -v "${S}/subprojects/packagefiles/tree-sitter-${TREE_SITTER_VERSION}/"meson.build "${S}/subprojects/tree-sitter-${TREE_SITTER_VERSION}"/
}

src_configure() {
    local emesonargs=(
	-Dcapstone_in_builddir=false
	-Duse_sys_capstone=enabled
	-Duse_sys_magic=enabled
	-Duse_sys_zip=enabled
	-Duse_sys_zlib=enabled
	-Duse_sys_lz4=enabled
	-Duse_sys_openssl=enabled
	-Duse_sys_xxhash=enabled
	-Duse_sys_libzip=enabled
	-Duse_libuv=true
	-Denable_tests=false
	-Denable_rz_test=false
	-Dsubprojects_check=false
	-Dbenchmark=disabled
    )
    meson_src_configure
}
