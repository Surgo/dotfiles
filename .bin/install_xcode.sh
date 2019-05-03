#!/usr/bin/env bash
xcode-select --install
sudo -i bash << EOF
xcodebuild -license accept
EOF
