#!/bin/sh
# SPDX-FileCopyrightText: 2026 Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0

set -eu

cat <<EOF >>/etc/portage/make.conf
ACCEPT_KEYWORDS="amd64"
ACCEPT_LICENSE="*"
EMERGE_DEFAULT_OPTS="--autounmask=y --autounmask-continue=y --getbinpkg --usepkg --jobs=2"
MAKEOPTS="-j$(nproc)"
FEATURES="getbinpkg -pid-sandbox -ipc-sandbox -network-sandbox"
EOF

mkdir -p /etc/portage/binrepos.conf/
cat <<EOF >/etc/portage/binrepos.conf/gentoobinhost.conf
[binhost]
priority = 9999
sync-uri = https://distfiles.gentoo.org/releases/amd64/binpackages/23.0/x86-64/
EOF

# Match binhost USE flags
cat <<EOF >>/etc/portage/package.use/use
media-libs/mesa vulkan wayland
sys-devel/gcc lto pgo
x11-libs/libxkbcommon X wayland
EOF

emaint sync -a >/dev/null
emerge --update --oneshot -v app-portage/getuto
getuto

emerge --update --deep --newuse -v @world
emerge --update -v llvm-core/llvm llvm-core/clang dev-util/pkgcheck

mkdir -p /etc/portage/package.accept_keywords
cat > /etc/portage/package.accept_keywords/ci <<EOF
www-client/google-chrome-unstable ~amd64
EOF
emerge --onlydeps -v www-client/google-chrome-unstable
