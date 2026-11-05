#!/bin/sh
# SPDX-FileCopyrightText: 2026 Florian Albrechtskirchinger <falbrechtskirchinger@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0

set -eu

emaint sync -a >/dev/null
emerge --update -v dev-vcs/git dev-util/pkgcheck net-misc/openssh llvm-core/llvm llvm-core/clang
emerge --update --deep --newuse -v @world

mkdir -p /etc/portage/package.accept_keywords
cat > /etc/portage/package.accept_keywords/ci <<EOF
www-client/google-chrome-unstable ~amd64
EOF
emerge --onlydeps -v www-client/google-chrome-unstable
