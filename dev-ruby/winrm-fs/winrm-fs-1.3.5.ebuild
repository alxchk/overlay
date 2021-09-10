# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

inherit ruby-fakegem

DESCRIPTION="Ruby library for file system operations via Windows Remote Management"
HOMEPAGE="https://rubygems.org/gems/winrm-fs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

ruby_add_rdepend "
>=dev-ruby/erubi-1.8
>=dev-ruby/logging-1.6.1
>=dev-ruby/rubyzip-2.0
>=dev-ruby/winrm-2.0
"
ruby_add_bdepend "test? ( dev-ruby/minitest )"
