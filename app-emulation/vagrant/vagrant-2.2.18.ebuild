# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby25 ruby26 ruby27 ruby30"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="vagrant.gemspec"
RUBY_FAKEGEM_EXTRAINSTALL="keys plugins templates version.txt"
RUBY_FAKEGEM_TASK_DOC=""

inherit bash-completion-r1 ruby-fakegem

DESCRIPTION="A tool for building and distributing development environments"
HOMEPAGE="https://vagrantup.com/"
SRC_URI="https://github.com/hashicorp/vagrant/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+virtualbox"
RESTRICT="test"

RDEPEND="${RDEPEND}
	app-arch/libarchive
	net-misc/curl
	virtualbox? ( app-emulation/virtualbox )"

ruby_add_rdepend "
	>=dev-ruby/bcrypt_pbkdf-1.1
	>=dev-ruby/childprocess-4.1.0
	>=dev-ruby/ed25519-1.2.4
	dev-ruby/erubi
	>=dev-ruby/hashicorp-checkpoint-0.1.5
	>=dev-ruby/i18n-1.8:1
	>=dev-ruby/listen-3.5
	<dev-ruby/log4r-1.1.11
	>dev-ruby/mime-types-3.3
	>=dev-ruby/net-ssh-6.1.0
	>=dev-ruby/net-sftp-3.0
	>=dev-ruby/net-scp-3.0
	>=dev-ruby/rexml-3.2
	dev-ruby/rest-client:2
	dev-ruby/rubyzip:2
	>=dev-ruby/vagrant_cloud-3.0.5
	>=dev-ruby/wdm-0.1.1
"

# upstream specifies rake>=12 but it apparently doesn't need something this
# recent. Because vagrant builds fine with rake 10 and because stabilizing rake
# is tricky, we specify a lower dependency requirement here. This way, we'll be
# able to stabilize vagrant sooner.
ruby_add_bdepend "
	>=dev-ruby/rake-10.5.0
	>=dev-ruby/rubygems-1.3.6
"

all_ruby_prepare() {
	# remove bundler support
	sed -i '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die

	# loosen dependencies
	sed -e '/hashicorp-checkpoint\|i18n\|listen\|net-ssh\|net-scp\|net-sftp\|rake\|childprocess/s/~>/>=/' \
		-i ${PN}.gemspec || die

	# remove windows-specific gems
	sed -e '/wdm\|winrm/d' \
		-i ${PN}.gemspec || die

	# remove bsd-specific gems
	sed -e '/rb-kqueue/d' \
		-i ${PN}.gemspec || die

	# remove ruby_dep, it's unused and only listed to loosen ruby implementation deps
	sed -e '/ruby_dep/d' \
		-i ${PN}.gemspec || die

	sed -e "s/@VAGRANT_VERSION@/${PV}/g" "${FILESDIR}/${PN}.in" > "${PN}" || die
}

all_ruby_install() {
	all_fakegem_install

	newbashcomp contrib/bash/completion.sh ${PN}

	# provide executable similar to upstream:
	# https://github.com/hashicorp/vagrant-installers/blob/master/substrate/modules/vagrant_installer/templates/vagrant.erb
	dobin "${PN}"

	# directory for plugins.json
	keepdir /var/lib/vagrant

	insinto /usr/share/vim/vimfiles/syntax/
	doins contrib/vim/vagrantfile.vim
}
