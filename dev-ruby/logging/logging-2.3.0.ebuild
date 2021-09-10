# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

inherit ruby-fakegem

DESCRIPTION="Flexible logging library for use in Ruby programs"
HOMEPAGE="https://rubygems.org/gems/gyoku"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

ruby_add_rdepend "
>=dev-ruby/little-plugger-1.1
>=dev-ruby/multi_json-1.14
"
