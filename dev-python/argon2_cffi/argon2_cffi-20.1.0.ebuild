# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} pypy3 )
inherit distutils-r1

DESCRIPTION="CFFI bindings to the Argon2 password hashing library"
HOMEPAGE="https://github.com/hynek/argon2-cffi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/argon2-cffi-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	app-crypt/argon2:=
	dev-python/six[${PYTHON_USEDEP}]
	virtual/python-cffi[${PYTHON_USEDEP}]
"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${COMMON_DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

DOCS=( AUTHORS.rst CHANGELOG.rst FAQ.rst README.rst )
S="${WORKDIR}/argon2-cffi-${PV}"

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_configure_all() {
	export ARGON2_CFFI_USE_SYSTEM=1
}
