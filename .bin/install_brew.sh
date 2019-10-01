#!/usr/bin/env bash
# See: <https://docs.brew.sh/Installation#alternative-installs>

sudo -i bash << EOF
mkdir -p /opt
chown -R "$LOGNAME":staff /opt
EOF

cd /opt && mkdir -p homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

cd "$HOME"
/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew bundle
