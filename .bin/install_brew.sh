#!/usr/bin/env bash
# See: <https://docs.brew.sh/Installation#alternative-installs>

sudo -i bash << EOF
mkdir -p /opt
chown -R "$LOGNAME":staff /opt
EOF

cd /opt || exit && mkdir -p homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

cd "$HOME" || exit
export PATH=/opt/homebrew/bin:"$PATH"
/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew bundle
