# Copyright 2018-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby24 ruby25 ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_RECIPE_DOC="none"

inherit ruby-fakegem

DESCRIPTION="Vagrant Cloud API Library"
HOMEPAGE="https://github.com/hashicorp/vagrant_cloud"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}/all/${PN}-${PV}"

ruby_add_rdepend "
>=dev-ruby/excon-0.73
>=dev-ruby/log4r-1.1.10
>=dev-ruby/rexml-3.2.5
"
ruby_add_bdepend ">=dev-ruby/rake-10.4
	test? ( >=dev-ruby/webmock-3.0 )"
