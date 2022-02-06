#!/usr/bin/env bash

cd "$HOME"
git submodule update --init
git submodule foreach 'git fetch; git reset --hard origin/master'
