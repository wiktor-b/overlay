# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 font

DESCRIPTION="A pretty, legible bitmap font with a wide selection of glyphs"
HOMEPAGE="https://memleek.org/leggie/"
EGIT_REPO_URI="https://git.memleek.org/leggie/"

LICENSE="CC-BY-4.0"
SLOT="0"
KEYWORDS=""
IUSE="dotted-zero l10n_sr +psf"

DEPEND="psf? ( app-arch/gzip app-text/bdf2psf )"
RDEPEND=""

DOCS="README LICENCE"

src_compile() {
	use dotted-zero && eapply "${S}/patches/dotted-zero.patch"
	use l10n_sr && eapply "${S}/patches/serbian.patch"
	use psf && emake psf
}

src_install() {
	use X && emake BDFDEST="${D}/usr/share/fonts" installbdf
	use psf && emake PSFDEST="${D}/usr/share/consolefonts" installpsf
}
