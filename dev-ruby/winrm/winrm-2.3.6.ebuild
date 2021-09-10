# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

inherit ruby-fakegem

DESCRIPTION="Ruby library for Windows Remote Management"
HOMEPAGE="https://rubygems.org/gems/winrm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

ruby_add_rdepend "
>=dev-ruby/builder-2.1.2
>=dev-ruby/erubi-1.8
>=dev-ruby/gssapi-1.2
>=dev-ruby/gyoku-1.0
>=dev-ruby/httpclient-2.2
>=dev-ruby/logging-1.6.1
>=dev-ruby/nori-2.6.0
>=dev-ruby/rubyntlm-2.3.6
"
ruby_add_bdepend "test? ( dev-ruby/minitest )"
