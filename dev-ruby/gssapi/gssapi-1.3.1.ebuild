# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

inherit ruby-fakegem

DESCRIPTION="GSSAPI library"
HOMEPAGE="https://rubygems.org/gems/gssapi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.1"
ruby_add_bdepend "test? ( dev-ruby/minitest )"
